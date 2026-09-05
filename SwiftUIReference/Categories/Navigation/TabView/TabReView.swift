//
//  TabReView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 3/21/25.
//

import SwiftUI




struct ZampleView: View {
    var body: some View {
        //
        NavigationStack {
            ScrollView {
                RoundedRectangle(cornerRadius: 0)
                    .frame(width: .infinity, height: 1000)
            }
            .navigationTitle("Text 1")
            .modifier(MDToolbarModfier())
            
        }
    }
}

struct ZampleView1: View {
    @Binding var showCustomButtonView: Bool
    var body: some View {
        //
        NavigationStack {
            Button {
                self.showCustomButtonView.toggle()
            } label : {
                Text("Show Custom View below tab")
            }
        }
        .navigationTitle("Text 2")
        .modifier(MDToolbarModfier())
        
    }
    
}
struct ZampleView2: View {
    var body: some View {
        //
        NavigationStack {
            ScrollView {
                Text("ZampleView2")
                    .navigationTitle("Text 3")
                    .modifier(MDToolbarModfier())
            }
        }
    }
    
}

struct TabReView: View {
    @State private var selectedTab: Int = 0  // Default selected tab index
    @State private var showCustomButtonView: Bool = false
    
    var body: some View {
        VStack {
            // Tab View
            TabView(selection: $selectedTab) {
                
                ZampleView1(showCustomButtonView: $showCustomButtonView)
                    .tabItem {
                        Label("View 1", systemImage: "window.shade.open")
                    }
                    .tag(0)
                
                ZampleView2()
                    .tabItem {
                        Label("View 2", systemImage: "window.shade.open")
                    }
                    .tag(2)
                NavStackSkip()
                    .tabItem {
                        Label("Stack Ref", systemImage: "square.stack.3d.up.fill")
                    }
                    .tag(1)
                
                NavigationStack3()
                    .tabItem {
                        Label("Nav Stack", systemImage: "list.bullet.rectangle.portrait.fill")
                    }
                    .tag(3)
            }
            
            // Sample View
            if showCustomButtonView {
                ZStack {
                    Color.red
                        .frame(height: 80)
                    //                    .cornerRadius(20)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                    
                    Text("Custom Bottom View")
                }
            }
        }
        
        
        
        
    }
}
#Preview {
    TabReView()
}


