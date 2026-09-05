//
//  ButtonTypesView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct ButtonTypesView: View {
    var body: some View {
        
        // Button Sample 1
        Button("Button Type 1") {
            print("Button Pressed")
        }
        .font(.title3)
        .padding()

        
        // Button Sample 2
        Button {
            print("Button Pressed")
        } label: {
            Text("Button Type 2")
                .font(.title3)
        }
        .padding()
    }
}

#Preview {
    ButtonTypesView()
}
