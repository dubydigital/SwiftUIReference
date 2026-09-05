//
//  PopoverSampleView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/22/26.
//

import SwiftUI

struct PopoverSampleView: View {
    @State private var showMenu = false

        var body: some View {
            Button {
                showMenu.toggle()
            } label: {
                Image(systemName: "ellipsis.circle")
                    .font(.title2)
            }
            .popover(
                isPresented: $showMenu,
                attachmentAnchor: .rect(.bounds)
            ) {
                VStack(alignment: .leading, spacing: 0) {

                    Button {
                        print("Edit")
                        showMenu = false
                    } label: {
                        Label("Edit", systemImage: "pencil")
                    }

                    Divider()

                    Button {
                        print("Duplicate")
                        showMenu = false
                    } label: {
                        Label("Duplicate", systemImage: "doc.on.doc")
                    }

                    Divider()

                    Button(role: .destructive) {
                        print("Delete")
                        showMenu = false
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                .buttonStyle(.plain)
                .padding()
                .frame(width: 200)
                .presentationCompactAdaptation(.popover)
            }
        }
}

#Preview {
    PopoverSampleView()
}


struct MiniPopoverMenu<Label: View, Content: View>: View {

    @State private var isPresented = false

    let label: () -> Label
    let content: () -> Content

    init(
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.content = content
    }

    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            label()
        }
        .popover(
            isPresented: $isPresented,
            attachmentAnchor: .rect(.bounds)
        ) {
            content()
                .padding()
                .presentationCompactAdaptation(.popover)
        }
    }
}
