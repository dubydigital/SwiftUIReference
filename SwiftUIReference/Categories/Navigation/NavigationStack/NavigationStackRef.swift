//
//  NavigationStackRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import SwiftUI
import Foundation

struct NavigationStackRef: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("Section 1") {
                        ForEach(0..<6, id: \.self) { i in
                            NavigationLink("Go to Detail \(i)", destination: ProfileView())
                        }
                    }
                    
                    Section("Section 2") {
                        ForEach(6...10, id: \.self) { i in
                            NavigationLink("Go to Detail \(i)", destination: ProfileView())
                        }
                    }
                }
                // Footnote
                Text("Foot Note Content")
            }
            .navigationTitle("Navigation Stack")
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
    NavigationStackRef()
}
