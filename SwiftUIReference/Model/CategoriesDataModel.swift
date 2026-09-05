//
//  CategoriesDataModel.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/1/26.
//

import Foundation
import SwiftUI

enum NestedViewType: Hashable {
    case accessibilityRefView
    // Alerts
    case simpleAlertRefView
    case complexAlertView
    case popoverSampleView
    // Buttons
    case buttonTypesView
    case dismissButtonView
    // Colors
    case colorSampleView
    // Text
    case textAndLabelsUIView
    // Images
    // Extensions & Modifiers
    case toolBarModifierSampleView
    // Cool Features
    case automaticGrammarAgreementRefView
    // Data Flow
    case concurency
    case propertyWrappers
    // List Collections
    case gridRef
    case horizontalScroll
    case lazyHorizontalGrid
    case list
    // Network
    case networkList
    // Navigation
    case navSplitAltRefView
    case navSplitRefUIView
    case navigationStackRef
    case navigationStackSkip
    case navigationView
    case tabView
    // UIKit
    case lazyLoadingTableView
    case simpleContainerView
        
    // ... Imagine 47 more cases here
    
    // The @ViewBuilder attribute allows you to return different types of views natively
    var source: String {
        switch self {
        case .networkList: MusicListView().sourceString
        default:
            "Default Source Value"
        }
       
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        //CustomComponents
            // TOOD: components here
        // Accessibility
        case .accessibilityRefView: AccessibilityRefView()
        // Alerts
        case .simpleAlertRefView: SimpleAlertRefView()
        case .complexAlertView: ComplexAlertView()
        case .popoverSampleView: PopoverSampleView()
        // Buttons
        case .buttonTypesView: ButtonTypesView()
        case .dismissButtonView: DismissButtonView(isShowingDetailView: Binding.constant(false))
        case .colorSampleView: ColorsSampleView()
        case .textAndLabelsUIView: TextAndLabelsUIView()
        case .automaticGrammarAgreementRefView: AutomaticGrammarAgreementRefView()
        // TOOD: Images here
            
        // Extensions & Modifiers
        case .toolBarModifierSampleView: ToolBarModifierSampleView()
        // Cool Features
            
        // Data Flow
        case .concurency: TaskReferenceView()
        case .propertyWrappers: PropertyWrapperView()
        // List Collections
        case .gridRef: GridRefUIView()
        case .horizontalScroll: HorizontalScrollView()
        case .lazyHorizontalGrid: LazyHGridRefView()
        case .list: ListSampleView()
        // Network
        case .networkList: MusicListView()
        // Navigation
        case .navSplitAltRefView: NavSplitAltRefView()
        case .navSplitRefUIView: NavSplitRefUIView()
        case .navigationStackRef: NavigationStackRef()
        case .navigationStackSkip: NavStackSkip()
        case .navigationView: NavigationViewREFView()
        case .tabView: TabReView()
        // UIKit
        case .lazyLoadingTableView: LazyLoadingTableView()
        case .simpleContainerView: SimpleContainerUIView()
            
        }
    }
}

final class CategoriesDataModel {
    static let shared = CategoriesDataModel()
    private init() {}
    
    // View
    let viewSubCategories: [Category] = [
 
        Category(name: "Alerts", systemImage: "exclamationmark.bubble", subcategories: [], items: [
            DetailItem(title: "Simple Alert", description: "Alerts", nestedView: .simpleAlertRefView),
            DetailItem(title: "Complex Alerts", description: "Alerts", nestedView: .complexAlertView)
        ]),
        Category(name: "Buttons", systemImage: "button.programmable", subcategories: [], items: [
            DetailItem(title: "Button Types", description: "Buttons", nestedView: .buttonTypesView),
            DetailItem(title: "Buttons Dismiss", description: "Buttons", nestedView: .dismissButtonView)
        ]),
        Category(name: "Images", systemImage: "photo", subcategories: [], items: [
            DetailItem(title: "Images", description: "Images")
        ])]
    
    let navigationSubcategories: [Category] =  [
        Category(name: "NavigationSplitView", systemImage: "square.stack", subcategories: [], items: [
            DetailItem(title: "NavigationSplitView",
                       description: "NavigationSplitView Reference",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .navSplitRefUIView,
                       showFullScreenSheet: true ),
            DetailItem(title: "NavigationSplitView Alternate",
                       description: "NavigationSplitView Alternate Reference",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .navigationStackRef,
                       showFullScreenSheet: true )
        ])
    ]
    
    lazy var mainCategories: [Category] = [
        Category(name: "View", systemImage: "macwindow", subcategories:  viewSubCategories, items: [
            DetailItem(title: "Accessibility", description: "Accessibility", systemImage: "accessibility", nestedView: .accessibilityRefView ),
            DetailItem(title: "Colors", description: "Color", systemImage: "paintpalette", nestedView: .colorSampleView),
            DetailItem(title: "Text Label", description: "Text Label", systemImage: "textformat", nestedView: .textAndLabelsUIView ),
 
        ] ),
        Category(name: "Network", systemImage: "network", subcategories: [], items: [
            DetailItem(title: "Simple Network", description: "Network", systemImage: "network", nestedView: .networkList)
        ]),
        Category(name: "Extensions & Modifiers", systemImage: "slider.horizontal.3", subcategories: [], items: [
            DetailItem(title: "Extensions & Modifiers",
                       description: "Extensions & Modifiers",
                       systemImage: "slider.horizontal.3",
                       nestedView: .toolBarModifierSampleView,
                       showFullScreenSheet: true )
        ]),
        Category(name: "Data Flow", systemImage: "arrow.triangle.branch", subcategories: [], items: []),
        Category(name: "List Collections", systemImage: "list.bullet", subcategories: [], items: []),
        Category(name: "Navigation", systemImage: "point.topleft.down.to.point.bottomright.curvepath", subcategories: navigationSubcategories, items: [
            DetailItem(title: "NavigationStack",
                       description: "NavigationStack Reference",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .navigationStackRef,
                       showFullScreenSheet: true ),
            DetailItem(title: "NavigationStack Skip",
                       description: "NavigationStack Skip Reference",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .navigationStackSkip,
                       showFullScreenSheet: true ),
            DetailItem(title: "NavigationView",
                       description: "Navigation View Reference",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .navigationView,
                       showFullScreenSheet: true ),
            DetailItem(title: "TabView",
                       description: "TabView",
                       systemImage: "rectangle.bottomthird.inset.filled",
                       nestedView: .tabView,
                       showFullScreenSheet: true )
        ]),
        Category(name: "UIKit", systemImage: "uiwindow.split.2x1", subcategories:  [], items: []),
        Category(name: "Custom Components", systemImage: "books.vertical", subcategories:  [], items: []),
        Category(name: "Cool Features", systemImage: "sparkles", subcategories: [], items: []),
    ]
    
    lazy var mockCategory: Category = Category(name: "xxx", systemImage: "macwindow", subcategories:viewSubCategories, items: [])
}



// add lazy
