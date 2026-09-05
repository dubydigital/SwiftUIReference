//
//  ToolBarModifierSampleView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/4/26.
//

import SwiftUI

struct ToolBarModifierSampleView: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .sourceCodeToolbar(code: "")
                .popoverToolbar()
        }
    }
}

#Preview {
    ToolBarModifierSampleView()
}
