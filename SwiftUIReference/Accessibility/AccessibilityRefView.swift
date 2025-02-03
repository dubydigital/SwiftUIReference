//
//  AccessibilityRefView.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 2/3/25.
//


/**
 To Test:
 Xcode > Open Developer Tool > Accessibility Inspector
 
 Dynamic Text Scaling                   .font(.body), .dynamicTypeSize()
 Minimum Scaling Factor              .minimumScaleFactor(0.5)
 Dark Mode Support                      .foregroundColor(.primary), .background(.secondary)
 Button & Label Scaling                .dynamicTypeSize(.medium ... .accessibility2)
 Testing Accessibility                     .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
 **/

import SwiftUI

struct AccessibilityRefView: View {
    
    // Adaptive color
    let adaptiveColor = Color(UIColor { traitCollection in
        return traitCollection.userInterfaceStyle == .dark ? .white : .black
    })
    
    var body: some View {
        //  Basic Accessibility Modifier
        ScrollView {
            VStack {
                Spacer()
                
                Text("Minimum Scale Factor")
                    .font(.body) // ✅ Adjusts to user’s preferred text size
                    .lineLimit(nil) // ✅ Allows wrapping
                    .minimumScaleFactor(0.5) // ✅ Scales down if necessary
                
                Text("Accessibility Hint")
                    .padding(5)
                    .dynamicTypeSize(.xSmall ... .accessibility2) // ✅ Supports extreme scaling
                    .accessibilityLabel("Greeting Text")
                    .accessibilityHint("Adjusts the volume level")
                
                Button("Tap Me") {
                    print("Button tapped")
                }
                .padding(5)
                .accessibilityLabel("Tap to Continue")
                
                Image(systemName: "house.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .accessibilityLabel("Home Icon")
                    .padding(5)
                
                Text("""
                    ✅ Auto-adjusts for dark/light mode
                    .foregroundColor(Color.primary) 
                    ✅ Supports extreme scaling
                     .dynamicTypeSize(.xSmall ... .accessibility2)  
                    ✅ Adjusts to user’s preferred text size
                    .font(.body)
                    ✅ Allows wrapping
                    .lineLimit(nil) 
                    ✅ Scales down if necessary
                    .minimumScaleFactor(0.5) 
                    ✅ Ignores internal elements
                    .accessibilityElement(children: .ignore) 
                    ✅ Makes VoiceOver recognize it as a button
                     .accessibilityAddTraits(.isButton) 
                    ✅ Adds "selected" state
                    .accessibilityAddTraits(.isSelected)
                    ❌ VoiceOver will ignore this text
                    .accessibilityHidden(true)
                    """)
                
            }
        }
        
        // Accessibility for Scrollable Lists
        List {
            ForEach(1..<5) { index in
                HStack {
                    Image(systemName: "folder")
                    Text("File \(index)")
                }
                .accessibilityElement(children: .combine) // ✅ Reads "File 1" as one unit
            }
        }
    
    }
}

#Preview {
    AccessibilityRefView()
        .preferredColorScheme(.dark)        
}
