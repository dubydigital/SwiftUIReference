//
//  SourceCodeSampleView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/21/26.
//

import SwiftUI

struct SourceCodeContainerView: View {    
    var code = """
        struct Appetizer: Identifiable {
            let id: Int
            let name: String
            let price: Double
        }
        
        let appetizer = Appetizer(
            id: 1,
            name: "Buffalo Wings",
            price: 8.99
        )
        """
    
    var body: some View {
        ScrollView {
            SourceCodeView(sourceCode: code)
                .padding()
        }
    }
    
}

#Preview {
    SourceCodeContainerView()
}
