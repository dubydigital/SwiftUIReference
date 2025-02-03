//
//  NavSplitAltRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct NavSplitAltRefView: View {
    @State private var selectedCategory: String?
    @State private var selectedSubitem: String?

    let categories = ["Category 1", "Category 2"]
    let subitems = ["Subitem A", "Subitem B"]

    var body: some View {
        NavigationSplitView {
            // Sidebar: Displays category list
            List(categories, id: \.self, selection: $selectedCategory) { category in
                Text(category)
            }
            .navigationTitle("Categories")
        } content: {
            // Content: Shows subitems when a category is selected
            if let category = selectedCategory {
                List(subitems, id: \.self, selection: $selectedSubitem) { subitem in
                    Text(subitem)
                }
                .navigationTitle(category)
            } else {
                Text("Select a category")
                    .navigationTitle("Subitems")
            }
        } detail: {
            // Detail: Shows details for the selected subitem
            if let subitem = selectedSubitem {
                Text("Detail for \(subitem)")
                    .navigationTitle(subitem)
            } else {
                Text("Select an item")
                    .navigationTitle("Detail")
            }
        }
    }
}


#Preview {
    NavSplitAltRefView()
}
