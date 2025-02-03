//
//  ContentViewModel.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import Foundation
import SwiftUI

struct MyNavigationItem: Identifiable {
    let id = UUID()
    let title: String
    let destination: AnyView
}


final class ContentViewModel: ObservableObject {
    
    let navigationItems: [MyNavigationItem] = [
        MyNavigationItem(title: "List Sample", destination: AnyView(ListSampleView())),
        MyNavigationItem(title: "Grid Sample", destination: AnyView(GridRefUIView())),        
        MyNavigationItem(title: "Button Types", destination: AnyView(ButtonTypesView())),
        MyNavigationItem(title: "Text & Labels", destination: AnyView(TextAndLabelsUIView())),
        MyNavigationItem(title: "NavigationView Ref", destination: AnyView(NavigationViewREFView())),
        MyNavigationItem(title: "NavigationStack Ref", destination: AnyView(NavigationStackRefUIView())),
        MyNavigationItem(title: "NavigationSplitView Ref", destination: AnyView(NavSplitAltRefView())),
        MyNavigationItem(title: "GridView Ref", destination: AnyView(GridRefUIView())),
        MyNavigationItem(title: "Simple Alerts", destination: AnyView(SimpleAlertRefView())),
        MyNavigationItem(title: "Complex Alerts", destination: AnyView(ComplexAlertView())),
        MyNavigationItem(title: "Coordinator Sample", destination: AnyView(SimpleContainerUIView())),
        MyNavigationItem(title: "Automatic Grammar Agreement", destination: AnyView(AutomaticGrammarAgreementRefView())),
        MyNavigationItem(title: "UIKit TableView", destination: AnyView(LazyLoadingTableView()))
        
    ]
    
    
}
/*List {
    NavigationLink("Button Types", destination: { ButtonTypesView() })
    NavigationLink("Text & Labels", destination: { TextAndLabelsUIView() })
    NavigationLink("NavigationView Ref", destination: { NavigationViewREFView() })
    NavigationLink("NavigationStack Ref", destination: { NavigationStackRefUIView() })
    NavigationLink("NavigationSplitView Ref", destination: { NavSplitAltRefView() })
    NavigationLink("GridView Ref", destination: { GridRefUIView() })
    NavigationLink("Simple Alerts", destination: { SimpleAlertRefView() })
    NavigationLink("Complex Alerts", destination: { ComplexAlertView() })
    NavigationLink("Coordinator Sample", destination: { SimpleContainerUIView() })
}*/
