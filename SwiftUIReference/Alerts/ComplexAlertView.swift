//
//  ComplexAlertView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 1/30/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dimissButton: Alert.Button
}

struct AlertContext {
    static let alert1 = AlertItem(title: "Alert 1 Tilte",
                                              message: "Alert 1 Message",
                                              dimissButton: .default(Text("OK")))
    static let alert2 = AlertItem(title: "Alert 2 Tilte",
                                              message: "Alert 2 Message",
                                              dimissButton: .default(Text("OK")))
}

struct ComplexAlertView: View {
    @State private var alertItem: AlertItem?
    var body: some View {
        NavigationView {
            InsideView(alertItem: $alertItem)
        }.alert(item: $alertItem) { alertItem in
            Alert(title: Text(alertItem.title),
                  message: Text(alertItem.message),
                  dismissButton: alertItem.dimissButton)
        }
    }
}

struct InsideView: View {
    @Binding var alertItem: AlertItem?
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: .infinity, height: 400)
            
            HStack {
                Button {
                    alertItem = AlertContext.alert1
                } label: {
                    Text("Alert 1")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }.padding()
                Button {
                    alertItem = AlertContext.alert2
                } label: {
                    Text("Alert 2")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }.padding()
            }
        }
    }
}

#Preview {
    ComplexAlertView()
}
