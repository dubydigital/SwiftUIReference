//
//  NavSplitRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct NavSplitRefUIView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Item 1", destination: MoreDetailView(detail: "Item 1"))
                NavigationLink("Item 2", destination: MoreDetailView(detail: "Item 2"))
            }.navigationTitle("Side bar")
        } detail: {
            Text("Select an item")
        }
    }
}

struct MoreDetailView: View {
    var detail: String
    var body: some View {
        Text("Detail for \(detail)").padding()
    }
}

#Preview {
    NavSplitRefUIView()
}
