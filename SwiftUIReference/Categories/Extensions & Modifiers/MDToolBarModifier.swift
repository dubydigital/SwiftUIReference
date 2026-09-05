//
//  MDToolBarModifier.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/3/26.
//

import Foundation
import SwiftUI

struct MDToolbarModfier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 16) {
                        Text("Nav")
                            .foregroundColor(.black)
                            .font(.custom("Gilroy-SemiBold", size: 15))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 15)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("A")
                        Text("B")
                    }
                }
                
            }
    }
}
