//
//  SimpleAlertRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 1/30/25.
//

import SwiftUI

//struct SimpleAlertRefView: View {
//    @State private var isShowingAlert = false
//    var body: some View {
//        NavigationView {
//            
//            Button {
//                isShowingAlert = true
//            } label: {
//                Text("Tap Me").font(.largeTitle)
//            }
//        }
//        .navigationTitle("Sample Alert")
//        .alert(isPresented: $isShowingAlert, content: {
//            Alert(title: Text("Test"),
//              message: Text("My Message"),
//              dismissButton: .default(Text("OK")) )
//        })
//    }
//}
//

struct SimpleAlertRefView: View {
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            Button {
                isShowingAlert = true
            } label: {
                Text("Show Alert")
                    .frame(width: .infinity, height: 60, alignment: .center)
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Simple Alert Sample")
        .alert( isPresented: $isShowingAlert, content: {
            //
            Alert(title: Text("Simple Alert Title"),
                  message: Text("Simple Alert message"),
                  dismissButton: .default(Text("OK")) )
        })
    }    
}


#Preview {
    SimpleAlertRefView()
}
