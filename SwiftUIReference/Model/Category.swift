//
//  Category.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/1/26.
//

import Foundation
import SwiftUI
internal import Combine

// iOS Categories
struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let systemImage: String?    
    var subcategories: [Category]
    var items: [DetailItem]
    
    init(
        name: String,
        systemImage: String? = nil,
        subcategories: [Category] = [],
        items: [DetailItem] = []
    ) {
        self.name = name
        self.systemImage = systemImage
        self.subcategories = subcategories
        self.items = items
    }
}


