//
//  HorizontalScrollView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/21/26.
//

import SwiftUI

struct HorizontalScrollView: View {
    
    var body: some View {
    
        ScrollView(.horizontal) {
            // HStack
            HStack {
                // Clip Shape
                Text("Hello")
                    .font(.title3)
                    .frame(width: 50, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle()) // Clips to a circular shape
                
                // button
                Button(action: {
                    print("Btn")
                }) {
                    Text("B")
                        .font(.subheadline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                }
                .frame(width: 50, height: 50)
                .mask(Circle()) // Masks the button in a circle
                
                                            
                // Making an image with a circle
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.blue)
                    .clipShape(Circle()) // Makes the image circular
                
                // Adding a Circular Border
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.red, lineWidth: 4) // Adds a border
                    )
                
                Image("EGA", label: Text("Eagle Globe And Anchor"))
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(5)
                    .padding()
                    .onTapGesture {
                        print("EGA Pressed")
                    }
                
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 50, height:50, alignment: .center)
                //                .imageScale(.small)
                    .foregroundStyle(.tint)
                    .padding()
                    .onTapGesture {
                        print("Globe Pressed")
                    }
                
            } // HStack
        } // Scroll View
    }
}

#Preview {
    HorizontalScrollView()
}
