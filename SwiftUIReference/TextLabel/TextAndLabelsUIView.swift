//
//  TextAndLabelsUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import SwiftUI

struct TextAndLabelsUIView: View {
    var body: some View {
        TextRefView()
        LabelRefView()
    }
}


struct TextRefView: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray)
            
            VStack {
                Divider().background(Color.white)
                
                //---------------------------------
                // Standard
                Text("Hello, SwiftUI!")
                    .font(.title)
                    .foregroundColor(.blue)
                
                //---------------------------------
                Divider().background(Color.white)
                
                // Formatting
                Text("SwiftUI is ")
                    .font(.title)
                + Text("awesome").bold().foregroundColor(.red)
                    .font(.largeTitle)
                + Text(" and powerful!")
                    .font(.title)
                
                //---------------------------------
                Divider().background(Color.white)
                // Multi
                Text("""
            From the halls of Montezuma.            
            To the Shores of Tripoli.
            
            We are here to fight our battles in the air or land and sea.
            """)
                .multilineTextAlignment(.leading)
                
                //---------------------------------
                Divider().background(Color.white)
                // Date
                Text(Date(), style: .date)
                    .onTapGesture {
                        print("\(Date())")
                    }.font(.largeTitle)
                // Example output: Jan 31, 2025
            }// VStack
        } // ZStack
        
    }
}


struct LabelRefView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle().fill(Color.green)
                VStack {
                    //---------------------------------
                    Divider().background(Color.black)
                    // Basic
                    Label("Settings", systemImage: "gear")
                        .font(.largeTitle)
                    
                    //---------------------------------
                    Divider().background(Color.black)
                    Label {
                        Text("Download")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    } icon: {
                        Image(systemName: "arrow.down.circle")
                            .foregroundColor(.blue)
                    }
                    
                    //---------------------------------
                    Divider().background(Color.black)
                    Button(action: { print("Tapped") }) {
                        Label("Add to Cart", systemImage: "cart.fill")
                            .font(.largeTitle)
                    }
                    
                    //---------------------------------
                    Divider().background(Color.black)
                    
                } // VStack
            }// ZStack
        }// NavigationStack
    }
}

#Preview {
    TextAndLabelsUIView()
}
