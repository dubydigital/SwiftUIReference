//
//  NavigationViewREFView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct NavigationViewREFView: View {
    @State var isShowingSheet = false
    @State var isShowingFullScreen = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Button to show sheet sample
                Button("Show Sheet") {
                    isShowingSheet = true
                }
                .tint(Color.white)
                .padding(10)
                .frame(width: 200, height: 50)
                .background(Color.red)
                .cornerRadius(10)
                
                // Button to show full screen sample
                Button("Show Sheet") {
                    isShowingFullScreen = true
                }
                .padding(10)
                .frame(width: 200, height: 50)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                })
                                
                // Navigation Link
                NavigationLink("Push View", destination: { Text("Detail View")})
                    .tint(Color.white)
                    .padding(10)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                
                
                // Link
                Link("Pre-K-Moji Site", destination: URL(string: "https://prekmoji.com") ?? URL(string: "https://apple.com")!)
                    .tint(Color.white)
                    .padding(10)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .navigationTitle("NavigationView Sample")
            // Shows Sheet
            .sheet(isPresented: $isShowingSheet, content: {
                Text("Sheet Shown")
            }) // Shows Full Screen
            .fullScreenCover(isPresented: $isShowingFullScreen, content: {
                FullView(isShowingDetailView: $isShowingFullScreen)
            })
            
        }
    }
}

struct FullView: View {
    @Binding var isShowingDetailView:Bool    
    var body: some View {
        DismissButtonView(isShowingDetailView: $isShowingDetailView)
            .padding()
        Spacer()
        Text("Full Sheet Veiw")
        Spacer()
    }
}

#Preview {
    NavigationViewREFView()
}
