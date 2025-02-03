//
//  AutomaticGrammarAgreementRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import SwiftUI

struct AutomaticGrammarAgreementRefView: View {
    @State private var count = 1
    
    var body: some View {
        VStack {
            HStack {
                Button("+ Add") {count += 1}.padding()
                Button("- Remove") {count -= 1}.padding()
            }
//            Text("\(count) Person").padding()
            // AutomaticGrammarAgreement
            Text("^[\(count) Person](inflect: true)").padding()
        }
    }
}

#Preview {
    AutomaticGrammarAgreementRefView()
}
