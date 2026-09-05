//
//  TypeWriterComponentView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/4/26.
//


/*
 Package Dependencies:
 Add Package LaTeXSwiftUI - https://github.com/colinc86/LaTeXSwiftUI
 
 Font:
 Pixel12x10Mono | pixel-12x10.zip :
 Font downloaded from http://www.fontget.com
 To see how to install fonts go to https://www.fontget.com/help
 
 How to add the font
 1. Drag and add to Xcode Project:
    - Pixel12x10.tiff
    - Pixel12x10Mono.tiff
 2. Go Xcode -> Target -> info
    - Under Custom macOS Application target Properties aadd a key: Fonts provided by application
    - add 2 items: item 0 and item 1
 3. For each value add:
    item 0: Pixel12x10.ttf
    item 1: Pixel12x10Mono.ttf
 
 */

import SwiftUI

struct TypeWriterComponent: View  {
    let text: String
    var isComplete: Bool = true
    var generationID: UUID?
    var characterDelay: Duration = .milliseconds(40)
    var paddingFraction: CGFloat = 0.20
    var fontSize: CGFloat = 15
    var fontColor:Color = .orange
    

    @State private var revealedCharacterCount = 0
    @State private var latestText = ""
    @State private var latestComplete = true

    private var animationID: String {
        generationID?.uuidString ?? text
    }

    private var displayedText: String {
        String(text.prefix(revealedCharacterCount))
    }

    private var segments: [ResponseSegment] {
        ResponseMathParser.parse(displayedText, sourceIsComplete: isFullyRevealed)
    }

    private var isFullyRevealed: Bool {
        isComplete && revealedCharacterCount >= text.count
    }

    private var isTyping: Bool {
        !isFullyRevealed
    }

    var body: some View {
        GeometryReader { _ in
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        TimelineView(.periodic(from: .now, by: 0.4)) { context in
                            let cursorVisible = Int(context.date.timeIntervalSinceReferenceDate / 0.4) % 2 == 0

                            RichResponseView(
                                segments: segments,
                                showCursor: isTyping && cursorVisible,
                                fontSize: self.fontSize,
                                fontColor: self.fontColor
                                
                            )
                            .id("typedText")
                        }
                    }
                    .scrollBounceBehavior(.basedOnSize)
                    .onChange(of: revealedCharacterCount) { _, _ in
                        proxy.scrollTo("typedText", anchor: .bottom)
                    }
                }
            }
            .padding(20)
        }
        .onAppear {
            latestText = text
            latestComplete = isComplete
        }
        .onChange(of: text) { _, newValue in
            latestText = newValue
        }
        .onChange(of: isComplete) { _, newValue in
            latestComplete = newValue
        }
        .task(id: animationID) {
            revealedCharacterCount = 0
            latestText = text
            latestComplete = isComplete
            await animateReveal()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(text)
    }

    private func animateReveal() async {
        while !Task.isCancelled {
            let snapshot = latestText
            let complete = latestComplete
            let units = ResponseMathParser.revealUnits(in: snapshot, sourceIsComplete: complete)

            guard let next = units.first(where: { $0.end > revealedCharacterCount }) else {
                if complete {
                    revealedCharacterCount = snapshot.count
                    return
                }
                try? await Task.sleep(for: .milliseconds(40))
                continue
            }

            if next.isAtomicMath {
                revealedCharacterCount = next.end
                try? await Task.sleep(for: .milliseconds(120))
            } else {
                revealedCharacterCount += 1
                try? await Task.sleep(for: characterDelay)
            }
        }
    }
}

#Preview {
    ZStack {
//        Color.black.ignoresSafeArea()
        TypeWriterComponent(
            text: CategoriesDataModel.shared.dummyText,
            fontSize: 50,
            fontColor: .blue
            
        )
    }
}
