//
//  TypeWriterRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/4/26.
//

import SwiftUI
import Foundation

struct TypeWriterRefView: View {
    
    @State var fontSizeString:String = "16"
    var fontSize: CGFloat {
        CGFloat(Double(fontSizeString) ?? 16.0)
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter Font Size", text: $fontSizeString)
                    .font(.title2)
                    .keyboardType(.numberPad)
                    .padding(20)
                    .onChange(of: fontSizeString) { oldValue, newValue in
                        // Optional: Restricts user input strictly to whole digits in real-time
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            fontSizeString = filtered
                        }
                        print("oldValue:\(oldValue) newValue: \(newValue)")
//                        fontSize = CGFloat(Double(fontSizeString) ?? 16.0)
                    }
            }
            ZStack {
                Color.black.ignoresSafeArea()
                TypeWriterComponent(
                    text: CategoriesDataModel.shared.dummyText,
                    fontSize: fontSize, // my text value
                    fontColor: .green
                )
            }
        }
       
    }
}

#Preview {
    TypeWriterRefView()
}
