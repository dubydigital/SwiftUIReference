//
//  SimpleVC.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/1/25.
//

import Foundation
import UIKit
import SwiftUI

protocol SimpleVCDelegate: AnyObject {
    func didTapButton(value: String)
}

final class SimpleVC: UIViewController {
    // ViewController View
    let my_v:UIView = UIView()
    // Button
    let my_btn: UIButton = UIButton(frame: CGRect(x: 50, y: 200, width: 300, height: 50))
    // Delegate
    weak var simpleVCDelegate: SimpleVCDelegate?
        
    // Custom Initialization
    init(simpleVCDelegate: SimpleVCDelegate?) {
        super.init(nibName: nil, bundle: nil)
        self.simpleVCDelegate = simpleVCDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupView()
    }
    
    func setupView() {
        self.my_v.backgroundColor = .green
        my_v.addSubview(my_btn)
        self.view = my_v
    }
    
    func setupButton() {
        my_btn.setTitle("Btn", for: UIControl.State.normal)
        my_btn.layer.cornerRadius = 10
        my_btn.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle) //UIFont.systemFont(ofSize: 20.0)
        my_btn.backgroundColor = .blue
        my_btn.addTarget(self, action: #selector(btnAction ), for: UIControl.Event.touchUpInside)
    }
    
    // MARK: - Button Methods
    @objc private func btnAction() {
        print("Btn Action")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Day/Month/Year Hour:Minute:Second
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        self.simpleVCDelegate?.didTapButton(value:formattedDate )
    }
}

// 1️⃣ Create a SwiftUI Wrapper for the UIKit ViewController
struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return SimpleVC(simpleVCDelegate: nil) // Replace with your ViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No updates needed for static previews
    }
}

// 2️⃣ Enable Live Previews in SwiftUI
#Preview {
    ViewControllerPreview()
}
