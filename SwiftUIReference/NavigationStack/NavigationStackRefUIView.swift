//
//  NavigationStackRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import SwiftUI
import Foundation

struct NavigationStackRefUIView: View {
    
    var body: some View {
        NavigationStack {
            Text("Main Content")
//                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: ProfileView()) {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: ProfileView()) {
                            Label("Profile", systemImage: "person.crop.square")
                        }
                    }
                }
            
            List {
                ForEach(0..<6, id: \.self) { i in
                    NavigationLink("Go to Detail \(i)", destination: ProfileView())
                }
                ForEach(6...10, id: \.self) { i in
                    NavigationLink("Go to Detail \(i)", destination: ProfileView())
                }
                
            }
            
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Page")
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                }
            }
    }
}

#Preview {
    NavigationStackRefUIView()
}
