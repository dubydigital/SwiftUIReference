//
//  NavigationStack2.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 4/16/25.
//

import SwiftUI


class NavClass: ObservableObject {
    static let shared = NavClass()
    @Published  var path = NavigationPath()
    
}

// Define a Hashable data model
struct Page: Identifiable, Hashable {
    let id = UUID()
    let title: String
}

struct NavigationStack2: View {
    @ObservedObject var nav = NavClass.shared
    @State var showsPageRange = false
    var body: some View {
        NavigationStack(path: $nav.path) {
            VStack(spacing: 20) {
                Text("Main View")
                    .font(.largeTitle)
                
                NavigationLink(value: Page(title: "Page 5")) {
                    Text("Go to Page 5")
                }
                .padding()
                
                Button("Go to Page 5") {
                    nav.path.append(Page(title: "Page 5"))
                    
                }
                                
                Button("Go to Page 6") {
                    showsPageRange.toggle()
                }
            }
            .navigationDestination(for: Page.self) { page in
                PageFView(page: page, path: $nav.path)
            }
            .navigationDestination(isPresented: $showsPageRange) {
                PageXixView(path: $nav.path)
            }
        }

    }
}


#Preview {
    NavigationStack2()
}

struct PageFView: View {
    let page: Page
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("This is \(page.title)")
                .font(.title)
            
//            Button("Go to Page 6") {
//               path.append(Page(title: "Page 6"))
//            }
            NavigationLink(value: Page(title: "Page 6")) {
                PageXixView(path: $path)
            }
            
        }
//        .navigationDestination(for: Page.self) { page in
//            PageXixView(path: $path)
//        }
        .navigationTitle("Page 5")
        .padding()
    }
}

struct PageXixView: View {
    @Binding var path: NavigationPath
    @State var showNext: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Pop Root") {
                //                path = NavigationPath()
                NavClass.shared.path = NavigationPath()
            }
            
        }
        .navigationTitle("Page 6")
        .padding()
    }
}
