//
//  DismissButtonView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct DismissButtonView: View {
    @Binding var isShowingDetailView: Bool
    var body: some View {
        HStack() {
            Spacer()
            Button {
                isShowingDetailView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
        }
    }
}

#Preview {
    DismissButtonView(isShowingDetailView: Binding.constant(false))
}
