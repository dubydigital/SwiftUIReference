//
//  LazyHGridRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import SwiftUI

struct LazyHGridRefView: View {
    let items = Array (1...20) // Sample Data
    let rows = [GridItem(.fixed(100)),
                GridItem(.fixed(100)),
                GridItem(.fixed(100)),
                GridItem(.fixed(100))]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                     Text("Item \(item)")
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LazyHGridRefView()
}
