//
//  NavigationStack4.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 4/16/25.
//

import SwiftUI


import SwiftUI

// Define a model conforming to Hashable
//struct Page: Hashable {
//    let title: String
//}

struct NavigationStack4: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            FirstView(path: $path)
                .navigationDestination(for: Page.self) { page in
                    SecondView(page: page, path: $path)
                }
        }
    }
}

struct FirstView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("First View")
            Button("Go to Second View") {
                path.append(Page(title: "Second View"))
            }
        }
        .padding()
    }
}

struct SecondView: View {
    let page: Page
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("This is \(page.title)")
            Button("Go to Third View") {
                path.append(Page(title: "Third View"))
            }
        }
        .padding()
    }
}

struct ThirdView: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("Third View")
            Button("Pop to Root") {
                path = NavigationPath()
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack4()
}
