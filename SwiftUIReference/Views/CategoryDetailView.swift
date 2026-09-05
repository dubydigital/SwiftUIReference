//
//  CategoryDetailView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/1/26.
//

import SwiftUI

struct CategoryDetailView: View {
    let item: DetailItem
    @State var showFullScreen: Bool = false
    @State var kimbo: String = ""
    
    var body: some View {
            VStack {
                HStack() {
                    Text(item.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Text(item.description)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity )
                .background(.black.opacity(0.6))
                .cornerRadius(5)
                
                // Nested View
                if item.nestedView != nil {
                    // Display Nested View as Sheet
                    if item.showFullScreenSheet {
                        // Button to show full screen sample
                        Button("Show Sample") {
                            showFullScreen = true
                        }
                        .padding(10)
                        .frame(width: 200, height: 50)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        })
                    } else {
                        // Display Nested View here
                        item.nestedView?.view
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle(item.title)
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showFullScreen, content: {
                DetailFullView(item: item, isShowingDetailView: $showFullScreen, )
            })
            .sourceCodeToolbar(code: self.kimbo )
            .task {
                if let sourceString = item.nestedView?.source {
                    self.kimbo = sourceString
                }
            }
    }
    
}

struct DetailFullView: View {
    let item: DetailItem
    @Binding var isShowingDetailView:Bool
    
    var body: some View {
        VStack {
            DismissButtonView(isShowingDetailView: $isShowingDetailView)
                .padding(.trailing, 20)
                .padding(.top, 60 )
            
            if item.nestedView != nil {
                item.nestedView?.view
            } else {
                Text("Full Sheet Veiw")
                Text("Modifier: .fullScreenCover")
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
        
}


#Preview {
    CategoryDetailView(item: DetailItem(title: "xxx",
                                        description: "xxx",
                                        nestedView: .navigationStackRef,
                                        showFullScreenSheet: true))
}
