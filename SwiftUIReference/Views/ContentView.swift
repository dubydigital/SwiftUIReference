//
//  ContentView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // LinearGradient Sample Background
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                // Rectangle with Blur
                Rectangle()
                    .fill(Color.white.opacity(0.3) )
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(20)
                    .padding(10)
                    .blur(radius: 10)
                                
                VStack {
                    // Text Sample
                    Text("SwiftUI Reference").font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                    
                    // Label
                    Label("Label system image", systemImage: "cart.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                                        
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
                                    .font(.title3)
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
                    
                    List(self.viewModel.navigationItems ) { item in
                        NavigationLink(item.title, destination: item.destination)
                    }
                    .navigationTitle("Reference")
                    .background(.blue.opacity(0.5))
                    .cornerRadius(10)
                    .scrollContentBackground(.hidden)
                                        
                    Spacer()
                    
                } // VStack
                .padding()
            } // ZStack
        }// NavigaionStack
    }
    
}

#Preview {
    ContentView()
}


