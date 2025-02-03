//
//  ContentView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 10/23/24.
//

import SwiftUI

struct ContentView: View {
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
                    Text("SwiftUI Reference").font(.system(size: 40))
                        .foregroundColor(.white)
                        .padding()
                    
                    // Label
                    Label("Label system image", systemImage: "cart.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                    
                    // HStack
                    HStack {
                        Image("EGA", label: Text("Eagle Globe And Anchor"))
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(20)
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
                    
                    List {
                        NavigationLink("Button Types", destination: { ButtonTypesView() })
                        NavigationLink("Text & Labels", destination: { TextAndLabelsUIView() })
                        NavigationLink("NavigationView Ref", destination: { NavigationViewREFView() })
                        NavigationLink("NavigationStack Ref", destination: { NavigationStackRefUIView() })
                        NavigationLink("NavigationSplitView Ref", destination: { NavSplitAltRefView() })
                        NavigationLink("GridView Ref", destination: { GridRefUIView() })
                        
                        NavigationLink("Simple Alerts", destination: { SimpleAlertRefView() })
                        NavigationLink("Complex Alerts", destination: { ComplexAlertView() })
                        NavigationLink("Coordinator Sample", destination: { SimpleContainerUIView() })
                                                
                    }
                                       
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
