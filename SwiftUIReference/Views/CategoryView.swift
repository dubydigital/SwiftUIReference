//
//  CategoryView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/1/26.
//

import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        List {
            ForEach(category.subcategories) { subcategory in
                NavigationLink(value: subcategory) {
                    Label(
                        subcategory.name,
                        systemImage: subcategory.systemImage ?? "folder"
                    )
                }
            }

            ForEach(category.items) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.systemImage ?? "doc.text")
                }
            }
        }
        .navigationTitle(category.name)
    }
}

#Preview {
    CategoryView(category: CategoriesDataModel.shared.mockCategory )
}
