//
//  RichResponseView.swift
//  LLM Sliders
//
//  Created by Mark Dubouzet on 8/20/26.
//

import LaTeXSwiftUI
import SwiftUI

struct RichResponseView: View {
    let segments: [ResponseSegment]
    var showCursor: Bool = false
    var fontSize: CGFloat = 25
    var fontColor: Color = .orange

//     var pixelFont = Font.custom("Pixel12x10Mono", size: 20)
    private var pixelFont: Font {
          Font.custom("Pixel12x10Mono", size: fontSize)
      }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(groupedSegments) { group in
                switch group {
                case .block(let latex, _):
                    blockMath(latex)
                        .frame(maxWidth: .infinity)
                case .inlineRun(let parts, _):
                    WrappingHStack(spacing: 4, lineSpacing: 8) {
                        ForEach(inlinePieces(from: parts)) { piece in
                            switch piece.kind {
                            case .word(let word):
                                Text(word)
                                    .foregroundStyle(fontColor)
                                    .font(pixelFont)
                            case .math(let latex):
                                inlineMath(latex)
                            }
                        }
                    }
                }
            }
            
            if showCursor {
                Text("█")
                    .foregroundStyle(fontColor)
                    .font(pixelFont)
            }
        }
//        .background(.purple)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
        
        
    }

    private func inlineMath(_ latex: String) -> some View {
        LaTeX(latex)
            .parsingMode(.onlyEquations)
            .blockMode(.alwaysInline)
            .errorMode(.original)
            .renderingStyle(.wait)
            .foregroundStyle(fontColor)
            .font(.title3)
            .imageRenderingMode(.template)
    }

    private func blockMath(_ latex: String) -> some View {
        LaTeX(latex)
            .parsingMode(.onlyEquations)
            .blockMode(.blockViews)
            .errorMode(.original)
            .renderingStyle(.wait)
            .foregroundStyle(fontColor)
            .font(.title2)
            .imageRenderingMode(.template)
    }

    private enum SegmentGroup: Identifiable {
        case inlineRun([ResponseSegment], id: UUID)
        case block(String, id: UUID)

        var id: UUID {
            switch self {
            case .inlineRun(_, let id), .block(_, let id):
                return id
            }
        }
    }

    private var groupedSegments: [SegmentGroup] {
        var groups: [SegmentGroup] = []
        var current: [ResponseSegment] = []

        func flush() {
            guard !current.isEmpty else { return }
            groups.append(.inlineRun(current, id: current.first?.id ?? UUID()))
            current = []
        }

        for segment in segments {
            switch segment {
            case .blockMath(_, let latex):
                flush()
                groups.append(.block(latex, id: segment.id))
            case .text, .inlineMath:
                current.append(segment)
            }
        }
        flush()
        return groups
    }

    private struct InlinePiece: Identifiable {
        enum Kind {
            case word(String)
            case math(String)
        }

        let id: String
        let kind: Kind
    }

    private func inlinePieces(from parts: [ResponseSegment]) -> [InlinePiece] {
        var pieces: [InlinePiece] = []
        for (partIndex, part) in parts.enumerated() {
            switch part {
            case .text(_, let text):
                let tokens = text.split(separator: " ", omittingEmptySubsequences: false)
                for (index, token) in tokens.enumerated() {
                    let word = index == tokens.count - 1 ? String(token) : "\(token) "
                    if !word.isEmpty {
                        pieces.append(
                            InlinePiece(id: "\(partIndex)-word-\(index)", kind: .word(word))
                        )
                    }
                }
            case .inlineMath(_, let latex):
                pieces.append(InlinePiece(id: "\(partIndex)-math", kind: .math(latex)))
            case .blockMath:
                continue
            }
        }
        return pieces
    }
}

private struct WrappingHStack: Layout {
    var spacing: CGFloat = 4
    var lineSpacing: CGFloat = 6

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        arrange(proposal: proposal, subviews: subviews).size
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        let lines = arrange(proposal: ProposedViewSize(width: bounds.width, height: bounds.height), subviews: subviews)
        for (subview, frame) in zip(subviews, lines.frames) {
            subview.place(
                at: CGPoint(x: bounds.minX + frame.minX, y: bounds.minY + frame.minY),
                proposal: ProposedViewSize(frame.size)
            )
        }
    }

    private struct Arrangement {
        var size: CGSize
        var frames: [CGRect]
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> Arrangement {
        let maxWidth = proposal.width ?? .infinity
        var frames: [CGRect] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var lineHeight: CGFloat = 0
        var usedWidth: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x > 0, x + size.width > maxWidth {
                x = 0
                y += lineHeight + lineSpacing
                lineHeight = 0
            }
            frames.append(CGRect(origin: CGPoint(x: x, y: y), size: size))
            lineHeight = max(lineHeight, size.height)
            x += size.width + spacing
            usedWidth = max(usedWidth, x - spacing)
        }

        let width = maxWidth.isFinite ? maxWidth : usedWidth
        return Arrangement(size: CGSize(width: width, height: y + lineHeight), frames: frames)
    }
}
