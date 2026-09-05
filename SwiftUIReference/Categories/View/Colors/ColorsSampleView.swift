//
//  ColorsSampleview.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 8/22/26.
//

import SwiftUI

struct ColorsSampleView: View {
    var body: some View {
 
        ZStack {
            // LinearGradient Sample Background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            
            // Rectangle with Blur
            Rectangle()
                .fill(Color.white.opacity(0.3) )
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(20)
                .padding(10)
                .blur(radius: 10)
            
            VStack {
                
            }
            .frame(minWidth:300, minHeight: 400)
            .background(.white.opacity(0.6))
            .cornerRadius(10)
            .padding(20)
        }
        
        
    }
}

#Preview {
    ColorsSampleView()
}
