//
//  DetailItem.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/4/26.
//

import Foundation
// Detail Item
struct DetailItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let systemImage: String?
    let nestedView: NestedViewType?
    let showFullScreenSheet: Bool
    let source: String

    init(title: String, description: String,
         systemImage: String? = nil,
         nestedView: NestedViewType? = nil,
         showFullScreenSheet: Bool = false,
         source:String = "No Source Added yet" ) {
        self.title = title
        self.description = description
        self.systemImage = systemImage
        self.nestedView = nestedView
        self.showFullScreenSheet = showFullScreenSheet
        self.source = source
    }
}
