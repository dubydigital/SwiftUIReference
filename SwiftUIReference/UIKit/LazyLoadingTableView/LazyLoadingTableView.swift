//
//  LazyLoadingTableView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import SwiftUI

struct LazyLoadingTableView: UIViewControllerRepresentable {
     
    func makeUIViewController(context: Context) -> MyTableViewController {
        MyTableViewController()
    }
    
    func updateUIViewController(_ uiViewController: MyTableViewController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(lazyLoadingTableView: self)
    }
    
    final class Coordinator: NSObject {
        private let lazyLoadingTableView: LazyLoadingTableView
        
        init(lazyLoadingTableView: LazyLoadingTableView) {
            self.lazyLoadingTableView = lazyLoadingTableView
        }
    }
}

#Preview {
    LazyLoadingTableView()
}
