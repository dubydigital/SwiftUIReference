//
//  SimpleContainerUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import SwiftUI

struct SimpleContainerUIView: View {
    @State var txtValue = "Text Value"
    var body: some View {
        VStack {
            Spacer()
            Text(txtValue)
                .padding()
                .font(.largeTitle)
                .background(Color.gray)
                .cornerRadius(10)
            // .frame(width: .infinity, height: 50, alignment: .center)
            
            SimpleUIView(txtValue: $txtValue)
                .cornerRadius(10)
                .padding()
//                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SimpleContainerUIView()
}
