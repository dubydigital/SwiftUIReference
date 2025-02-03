//
//  ListSampleView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import Foundation
import SwiftUI

struct ListSampleView: View {
    // Array
    let myArray:[String] = ["Chama 1", "Chama 2", "Chama 3"]
    // Dictionary
    let countryCodes: [String:String] = [
        "FR" : "France",
        "JP" :  "Japan",
        "UK" : "United Kingdom",
        "US" : "United States"
    ]
    
    var body: some View {
        VStack {
            Text("Herrow Word")
            
            // List From Arrayu
            List {
                ForEach(myArray, id: \.self) { chama in
                    Text(chama)
                        .onTapGesture {
                        print(chama)
                    }
                }
            }
            .frame(width: 300, height: 200, alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
            .scrollContentBackground(.hidden)
            
            // List From Dictionary
            List {
                ForEach(countryCodes.sorted(by: {$0.key < $1.key}), id: \.key) { key, value in
                    Text( " \(key) : \(value)" )
                }
            }
            
            // List From Unsorted Dictionary
            List {
                ForEach(Array(countryCodes), id: \.key ) { key, value in
                    Text( " \(key) : \(value)" )
                }
            }
            Spacer()
        }
        
    }
}

#Preview {
    ListSampleView()
}
