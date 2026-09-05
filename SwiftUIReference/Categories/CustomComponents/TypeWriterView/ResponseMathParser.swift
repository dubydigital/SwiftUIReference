//
//  ResponseMathParser.swift
//  LLM Sliders
//
//  Created by Mark Dubouzet on 8/20/26.
//

import Foundation

enum ResponseSegment: Identifiable, Equatable, Sendable {
    case text(id: UUID, String)
    case inlineMath(id: UUID, String)
    case blockMath(id: UUID, String)

    var id: UUID {
        switch self {
        case .text(let id, _), .inlineMath(let id, _), .blockMath(let id, _):
            return id
        }
    }
}

struct MathRevealUnit: Equatable, Sendable {
    /// Exclusive character offset from the start of the source.
    let end: Int
    let isAtomicMath: Bool
}

enum ResponseMathParser {
    /// Split model output into prose and completed math.
    ///
    /// Incomplete delimiters at the end are omitted unless `sourceIsComplete`
    /// is true, in which case they become ordinary text.
    static func parse(_ text: String, sourceIsComplete: Bool) -> [ResponseSegment] {
        parsedUnits(in: text, sourceIsComplete: sourceIsComplete).map(\.segment)
    }

    static func revealUnits(in text: String, sourceIsComplete: Bool) -> [MathRevealUnit] {
        parsedUnits(in: text, sourceIsComplete: sourceIsComplete).map {
            MathRevealUnit(end: $0.end, isAtomicMath: $0.isAtomicMath)
        }
    }

    private struct ParsedUnit {
        let segment: ResponseSegment
        let end: Int
        let isAtomicMath: Bool
    }

    private static func parsedUnits(in text: String, sourceIsComplete: Bool) -> [ParsedUnit] {
        var units: [ParsedUnit] = []
        var cursor = text.startIndex

        while cursor < text.endIndex {
            guard let opener = nextOpener(in: text, from: cursor) else {
                let remainder = String(text[cursor...])
                if !remainder.isEmpty {
                    units.append(
                        ParsedUnit(
                            segment: .text(id: UUID(), remainder),
                            end: text.count,
                            isAtomicMath: false
                        )
                    )
                }
                break
            }

            if opener.start > cursor {
                let prose = String(text[cursor..<opener.start])
                units.append(
                    ParsedUnit(
                        segment: .text(id: UUID(), prose),
                        end: text.distance(from: text.startIndex, to: opener.start),
                        isAtomicMath: false
                    )
                )
            }

            if let closer = findCloser(in: text, opener: opener) {
                let endIndex = text.index(closer, offsetBy: opener.closer.count)
                let source = String(text[opener.start..<endIndex])
                let segment: ResponseSegment = opener.isBlock
                    ? .blockMath(id: UUID(), source)
                    : .inlineMath(id: UUID(), source)
                units.append(
                    ParsedUnit(
                        segment: segment,
                        end: text.distance(from: text.startIndex, to: endIndex),
                        isAtomicMath: true
                    )
                )
                cursor = endIndex
            } else if sourceIsComplete {
                units.append(
                    ParsedUnit(
                        segment: .text(id: UUID(), String(text[opener.start...])),
                        end: text.count,
                        isAtomicMath: false
                    )
                )
                break
            } else {
                break
            }
        }

        return units
    }

    private struct Opener {
        let start: String.Index
        let innerStart: String.Index
        let closer: String
        let isBlock: Bool
    }

    private static func nextOpener(in text: String, from start: String.Index) -> Opener? {
        var index = start

        while index < text.endIndex {
            let character = text[index]
            if character == "$" {
                if isEscaped(in: text, at: index) {
                    index = text.index(after: index)
                    continue
                }
                let isDouble = text[index...].hasPrefix("$$")
                return Opener(
                    start: index,
                    innerStart: text.index(index, offsetBy: isDouble ? 2 : 1),
                    closer: isDouble ? "$$" : "$",
                    isBlock: isDouble
                )
            }

            if character == "\\" {
                if text[index...].hasPrefix("\\[") {
                    return Opener(
                        start: index,
                        innerStart: text.index(index, offsetBy: 2),
                        closer: "\\]",
                        isBlock: true
                    )
                }
                if text[index...].hasPrefix("\\(") {
                    return Opener(
                        start: index,
                        innerStart: text.index(index, offsetBy: 2),
                        closer: "\\)",
                        isBlock: false
                    )
                }
                if text[index...].hasPrefix("\\begin{"),
                   let name = environmentName(in: text, afterBeginAt: index)
                {
                    let prefixCount = "\\begin{\(name)}".count
                    return Opener(
                        start: index,
                        innerStart: text.index(index, offsetBy: prefixCount),
                        closer: "\\end{\(name)}",
                        isBlock: true
                    )
                }
            }

            index = text.index(after: index)
        }

        return nil
    }

    private static func findCloser(in text: String, opener: Opener) -> String.Index? {
        var index = opener.innerStart
        while index < text.endIndex {
            if text[index...].hasPrefix(opener.closer), !isEscaped(in: text, at: index) {
                if opener.closer == "$", text[index...].hasPrefix("$$") {
                    index = text.index(after: index)
                    continue
                }
                return index
            }
            index = text.index(after: index)
        }
        return nil
    }

    private static func environmentName(in text: String, afterBeginAt start: String.Index) -> String? {
        let prefix = "\\begin{"
        guard text[start...].hasPrefix(prefix) else { return nil }
        let nameStart = text.index(start, offsetBy: prefix.count)
        guard let nameEnd = text[nameStart...].firstIndex(of: "}") else { return nil }
        let name = String(text[nameStart..<nameEnd])
        return name.isEmpty ? nil : name
    }

    private static func isEscaped(in text: String, at index: String.Index) -> Bool {
        var count = 0
        var cursor = index
        while cursor > text.startIndex {
            cursor = text.index(before: cursor)
            if text[cursor] == "\\" {
                count += 1
            } else {
                break
            }
        }
        return count % 2 == 1
    }
}
