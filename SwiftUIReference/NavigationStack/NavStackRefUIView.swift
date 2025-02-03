//
//  NavStackRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct NavStackRefUIView: View {
    @State private var path: [String] = []
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            VStack {
                // Button
                Button("Go to Page 1") {
                    path.append("Page 1")
                }.padding()
                // Button
                Button("Go to Page 2") {
                    path.append("Page 2")
                }.padding()
                
                // List
                List {
                    NavigationLink("Go to Detail", destination: DetailView())
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: String.self) { value in
                Text("You are on \(value)")
                
//                if value == "Page 1" {
//                    PageOneView()
//                } else if value == "Page 2" {
//                    PageTwoView()
//                }
                
            }
        }
    }
}

struct PageOneView: View {
    var body: some View {
        VStack {
            Text("Welcome to Page 1")
                .font(.largeTitle)
        }
        .navigationTitle("Page 1")
    }
}

struct PageTwoView: View {
    var body: some View {
        VStack {
            Text("Welcome to Page 2")
                .font(.largeTitle)
        }
        .navigationTitle("Page 2")
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
    }
}




#Preview {
    NavStackRefUIView()
}
