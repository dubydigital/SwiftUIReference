//
//  ReferenceModifiers.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/21/26.
//

import Foundation

import SwiftUI

/*
 Requires NavigationStack 
 */

struct SourceCodeToolbarModifier: ViewModifier {
    var code: String = ""
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SourceCodeContainerView(code: code, )
                    } label: {
                        Label("Source", systemImage: "chevron.left.forwardslash.chevron.right")
                    }
                }
            }
    }
}

struct PopOverToolbarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    MiniPopoverMenu {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                    } content: {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            NavigationLink {
                                Text("NavLink Sample")
                            } label: {
                                Label("Source", systemImage: "chevron.left.forwardslash.chevron.right")
                            }
                            
                            Button {
                                print("Settings")
                            } label: {
                                Label("Settings", systemImage: "gear")
                            }
                            
                            Button {
                                print("Source Code")
                            } label: {
                                Label("Source Code", systemImage: "chevron.left.forwardslash.chevron.right")
                            }
                        }
                        .buttonStyle(.plain)
                        .frame(minWidth: 170, alignment: .leading)
                    }
                }
            }
    }
}

extension View {
    func sourceCodeToolbar(code: String) -> some View {
        modifier(SourceCodeToolbarModifier(code: code ))
    }
    
    func popoverToolbar() -> some View {
        modifier(PopOverToolbarModifier())
    }
}
