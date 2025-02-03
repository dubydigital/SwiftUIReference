//
//  SimpleUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import SwiftUI

struct SimpleUIView: UIViewControllerRepresentable {
    @Binding var txtValue:String
    
    func makeUIViewController(context: Context) -> SimpleVC {
        SimpleVC(simpleVCDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: SimpleVC, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(simpleView: self)
    }
    
    final class Coordinator: NSObject, SimpleVCDelegate {
        private let simpleUIView: SimpleUIView
        
        init(simpleView: SimpleUIView) {
            self.simpleUIView = simpleView
        }
        
        func didTapButton(value: String) {
            self.simpleUIView.txtValue = value
        }
    }
}

#Preview {
    SimpleUIView(txtValue: .constant("Sample"))
}
