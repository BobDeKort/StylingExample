//
//  Models.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

// Define certain rounding styles you would like to achieve using corner radius
enum RoundingStyle {
    case slightlyRounded
    case circle
    case roundedSideHorizontal
    case roundedSideVertical
    case value(CGFloat)
    case none
}

// Base class to hold all possible styling attributes
class Style {
    var name: String {
        return String(describing: self)
    }
    
    // Stylable
    let isStylable: Bool
    var backgroundColor: UIColor? = nil
    var borderColor: UIColor? = nil
    var borderWidth: CGFloat? = nil
    var cornerRadius: RoundingStyle = .none
    var shadowColor: UIColor? = nil
    var shadowOffset: CGSize? = nil
    var shadowOpacity: Float? = nil
    var clipsToBounds: Bool? = nil
    
    // Text Stylable
    let isTextStylable: Bool
    var font: UIFont? = nil
    var textColor: UIColor? = nil
    var allignment: NSTextAlignment? = nil
    var isUppercased: Bool? = nil
    
    // Placeholder Stylable
    let isPlaceholderStylable: Bool
    var placeholderFont: UIFont? = nil
    var placeeholderTextColor: UIColor? = nil
    var placeholderTextAllignment: NSTextAlignment? = nil
    var placeholderIsUppercased: Bool? = nil
    
    init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        self.isStylable = isStylable
        self.isTextStylable = isTextStylable
        self.isPlaceholderStylable = isPlaceholderStylable
    }
    
    var className: String {
        return String(describing: self)
    }
}
