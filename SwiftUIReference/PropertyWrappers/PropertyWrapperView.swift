//
//  PropertyWrapperView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var username: String = "Devil Dog"
}

struct PropertyWrapperView: View {
    let userSettings = UserSettings()
    
    var body: some View {
        VStack {
            InnerView()
        }
        .environmentObject(userSettings)
    }
}

struct InnerView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        Text("Hello:  \(userSettings.username)" )
    }
}

#Preview {
    PropertyWrapperView()
}
