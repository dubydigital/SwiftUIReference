//
//  ReferenceProtocol.swift
//  SwiftUIReference
//
//  Created by Mark Dubouzet on 9/4/26.
//

import Foundation
import SwiftUI

// Can be added to View to conform to this protocol so views can include a sourceCode
protocol SourceCodeItem {
    var sourceCode: String { get set }
}

protocol SourceTrackedView: View {
    var sourceString: String { get }
}
