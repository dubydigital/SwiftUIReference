//
//  ContentView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 10/23/24.
//

import SwiftUI
import Foundation

//struct ContentView: View {
//    var viewModel = ContentViewModel()    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                                
//                VStack {                    
//                    List(self.viewModel.navigationItems ) { item in
//                        NavigationLink(item.title, destination: item.destination)
//                    }
//                    .navigationTitle("Reference")
////                    .background(.blue.opacity(0.5))
//                    .cornerRadius(10)
//                    .scrollContentBackground(.hidden)
//                                        
//                    Spacer()
//                    
//                } // VStack
//                .padding()
//            } // ZStack
//        }// NavigaionStack
//    }
//    
//}

struct ContentView: View {

    let categories: [Category]

    var body: some View {

        NavigationStack {

            List(categories) { category in
                NavigationLink(value: category) {
                    Label(
                        category.name,
                        systemImage: category.systemImage ?? "folder"
                    )
                }
            }
            .navigationTitle("Topics")
            .navigationDestination(for: Category.self) { category in
                CategoryView(category: category)
            }
            .navigationDestination(for: DetailItem.self) { item in
                CategoryDetailView(item: item  )
            }
        }
    }
}


#Preview {
    ContentView(categories: CategoriesDataModel.shared.mainCategories )
}


