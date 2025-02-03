//
//  ContentView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(20)
                .padding(50)
            VStack {
                HStack {
                    Image("EGA", label: Text("Eagle Globe And Anchor"))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .cornerRadius(20)
                        .padding()
                        .onTapGesture {
                            print("EGA Pressed")
                        }
                    
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 200, height:200, alignment: .center)
                    //                .imageScale(.small)
                        .foregroundStyle(.tint)
                        .padding()
                        .onTapGesture {
                            print("Globe Pressed")
                        }
                    
                } // HStack
                
                // Lable Sample
                Label("Add to Cart", systemImage: "cart.fill")
                    .font(.largeTitle)
                
                // Text Sample
                Text("Hello, world!").font(.system(size: 50))
                    .padding()
                
                // Button Sample 1
                Button("Button Type 1") {
                    print("Button Pressed")
                }
                .font(.largeTitle)
                .padding()
                
                // Button Sample 2
                Button {
                    print("Button Pressed")
                } label: {
                    Text("Button Type 2")
                        .font(.largeTitle)
                }
                
            } // VStack
            .padding()
        } // ZStack
    }
}

#Preview {
    ContentView()
}
