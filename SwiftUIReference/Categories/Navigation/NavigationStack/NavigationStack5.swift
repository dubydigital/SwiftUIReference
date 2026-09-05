//
//  NavigationStack5.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 4/16/25.
//

import SwiftUI


import SwiftUI

 

struct NavigationStack5: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Root View")
                Button("Go to First View") {
                    path.append(Page(title: "First View"))
                }
            }
            .navigationDestination(for: Page.self) { page in
                FirstView2(page: page, path: $path)
            }
        }
    }
}

struct FirstView2: View {
    let page: Page
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("This is \(page.title)")
            Button("Go to Second View") {
                path.append(Page(title: "Second View"))
            }
        }
        .navigationDestination(for: Page.self) { page in
            SecondView2(page: page, path: $path)
        }
    }
}

struct SecondView2: View {
    let page: Page
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            Text("This is \(page.title)")
            Button("Pop to Root") {
                path = NavigationPath()
            }
        }
    }
}


#Preview {
    NavigationStack5()
}
