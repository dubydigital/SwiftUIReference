//
//  NavigationStack3.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 4/16/25.
//

import SwiftUI
internal import Combine

class RegistrationCoordinator: ObservableObject {
    static let shared = RegistrationCoordinator()
    @Published var path = NavigationPath()
    
    enum RegistrationStep {
        case login
        case emailPassword
        case phoneVerification
    }
    
    func gotoEmail(){
        path.append( RegistrationStep.emailPassword)
    }
    func gotoPhone(){
        path.append( RegistrationStep.phoneVerification)
    }
}

struct NavigationStack3: View {
    @ObservedObject private var registrationCoordinator = RegistrationCoordinator.shared
    
    
    var body: some View {
        NavigationStack(path: $registrationCoordinator.path) {
            VStack {
                Button("Go to Email/Password") {
                    registrationCoordinator.gotoEmail()
                }
                .padding()
                Button("Go to Phone") {
                    registrationCoordinator.gotoPhone()
                }
                .padding()
                
                NavigationLink("Push View", destination: {
                        Page6View(path: $registrationCoordinator.path)
                    })
                    .tint(Color.white)
                    .padding(10)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }
            .navigationDestination(for: RegistrationCoordinator.RegistrationStep.self) { step in
                // Navigates to registration step
                return Group {
                    switch step {
                    case .emailPassword:
                        Page5View(path:$registrationCoordinator.path)
                    case .phoneVerification:
                        Page6View(path:$registrationCoordinator.path)
                    default:
                        Text("")
                    }
                }
            }
            
        }
    }
}



struct Page5View: View {
    @Binding var path: NavigationPath
    @State var showNext: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Pop Root") {
//                 path = NavigationPath()
                RegistrationCoordinator.shared.path = NavigationPath()
            }
            .padding()
            
            Button("Goto Page 6") {
                RegistrationCoordinator.shared.gotoPhone()
            }
        }
        .navigationTitle("Page 5")
        .padding()
    }
}


struct Page6View: View {
    @Binding var path: NavigationPath
    @State var showNext: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Pop Root") {
//                 path = NavigationPath()
                RegistrationCoordinator.shared.path = NavigationPath()
            }
        }
        .navigationTitle("Page 6")
        .padding()
    }
}


#Preview {
    NavigationStack3()
}
