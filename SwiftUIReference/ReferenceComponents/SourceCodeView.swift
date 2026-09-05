//
//  SourceCodeView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/21/26.
//

import Foundation
import SwiftUI

struct SourceCodeView: View {
    let sourceCode: String 
    
    @State private var didCopy = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Header
            HStack {
                Text("Swift")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Button {
                    copySourceCode()
                } label: {
                    Label(
                        didCopy ? "Copied" : "Copy",
                        systemImage: didCopy ? "checkmark" : "doc.on.doc"
                    )
                    .font(.caption)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            
            Divider()
            
            // Source Code
            ScrollView(.horizontal) {
                Text(sourceCode)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(.quaternary)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    private func copySourceCode() {
        UIPasteboard.general.string = sourceCode
        
        withAnimation {
            didCopy = true
        }
        
        Task {
            try? await Task.sleep(for: .seconds(1.5))
            
            await MainActor.run {
                withAnimation {
                    didCopy = false
                }
            }
        }
    }
}

#Preview {
    SourceCodeView( sourceCode: "string")
}
