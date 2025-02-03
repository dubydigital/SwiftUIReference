//
//  GridRefUIView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/2/25.
//

import SwiftUI

struct FrameworkTitleView: View {
    let frameWork: SampleFramework
    
    var body: some View {
        VStack {
            Image(frameWork.name)
                .resizable()
                .frame(width: 90, height: 90, alignment: .center)
            Text(frameWork.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct GridRefUIView: View {
//    let vm:GridRefUIModelView =  GridRefUIModelView()
    
    let columns: [GridItem]  = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    var body: some View {
 
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks, id: \.id) { framework in                        
                        Button(framework.name) {
                            print(framework.name)
                        }
                            .frame(width: 80, height: 80, alignment: .center)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .contentShape(Rectangle()) // Ensure entire area is tappable
                            .simultaneousGesture(TapGesture())
                    }
                } // LazyVGrid
 
            } //Scroll Veiw
        } // Navigation View
    }// Body
}

struct SampleFramework: Hashable, Identifiable {
    let id = UUID()
    let name: String
}

struct MockData  {
    static let frameworks = [
        SampleFramework(name: "App Clips"),
        SampleFramework(name: "ARKit"),
        SampleFramework(name: "CarPlay"),
        SampleFramework(name: "Catalyst"),
        SampleFramework(name: "ClassKit"),
        SampleFramework(name: "CloudKit"),
        SampleFramework(name: "Core ML"),
        SampleFramework(name: "HealthKit"),
        SampleFramework(name: "Metal"),
        SampleFramework(name: "SF Symbols"),
        SampleFramework(name: "SiriKit"),
        SampleFramework(name: "SpriteKit"),
        SampleFramework(name: "SwiftUI"),
        SampleFramework(name: "Test Flight"),
        SampleFramework(name: "Wallet"),
        SampleFramework(name: "WidgetKit"),
    ]
}

#Preview {
    GridRefUIView()
}
