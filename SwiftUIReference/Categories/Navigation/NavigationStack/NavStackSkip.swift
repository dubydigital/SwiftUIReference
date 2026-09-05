//
//  NavStackRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct NavStackSkip: View {
 
    @State private var path = NavigationPath()
    
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            VStack {
                // Button
                Button("Skip to Page 5") {
                    path.append("Page 1")
                    path.append("Page 2")
                    path.append("Page 3")
                    path.append("Page 4")
                    path.append("Page 5")
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
            .navigationDestination(for: String.self) { page in
                switch page {
                case "Page 5":
                    PageFiveView(path: $path)
                default:
                    Text(page)
                }
            }
       
        }
    }
}

struct PageFiveView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This is Page 5")
            Button("Pop to Root") {
                path = NavigationPath() // ✅ Reset navigation
            }
        }
        .padding()
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
    NavStackSkip()
}
