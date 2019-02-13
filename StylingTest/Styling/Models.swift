//
//  Models.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

// Define your styles below
enum Styles: String {
    // 1)
    case ExampleStyle
    
    case DefaultTextFieldHeader
    case DefaultTextField
    
    case continueButton
    
    // Define you styles here
    var style: Style {
        // 2)
        switch self {
        // MARK: Example Style
        case .ExampleStyle:
            /* How to setup a new style for the project
             1. Add new enum case just above here
             2. Add the newly added case to this switch
             3. Add your style properties and return the style as shown below
             Make sure to set the isStylable, isTextStylable and isPlacholderStylable
             properties when initialising your new style
             isStylable: Sets the background color, border style, corner radius and shadow.
                Currently supported by: All UIViews and sub classes
                Note: You can set corner radius and shadow that the same time on a UIView
                but not any other sub classes.
             isTextStylable: Sets the font, textColor, text allignment and
                can uppercase the current text in the component
                Currently supported by: UILable, UIButton, UITextField
             isPlaceholderStylable: Sets the font, textColor, textAllignment and
                can uppercase the current placeholder text in the component.
                Currenly supported by: UITextField
             
            */
            // 3)
            let newStyle = Style(name: self.rawValue,
                                 isStylable: false,
                                 isTextStylable: true,
                                 isPlaceholderStylable: false)
            
            // (You can remove any of the values below if you dont't need them for this style)
            
            // Background Stylable
            // Set you backround style properties here
            // Note: You can set corner radius and shadow at the same time on a UIView,
            // but not any other sub classes. You can ofcourse choose one of the two on
            // the sub classes
            newStyle.backgroundColor = .green
            newStyle.borderColor = .red
            newStyle.borderWidth = 5
            newStyle.cornerRadius = .roundedSideHorizontal
            newStyle.shadowColor = nil
            newStyle.shadowOffset = nil
            newStyle.shadowOpacity = nil
            newStyle.clipsToBounds = true
            
            // Text Stylable
            // Sets font, text color, allignment and can uppercase the current text of the component
            newStyle.font = .systemLarge
            newStyle.textColor = .marine
            newStyle.allignment = .center
            newStyle.isUppercased = false
            
            // PlaceholderStylable
            // Sets font, text color, allignment and can uppercase the current
            // placeholder text of the component
            
            newStyle.placeholderFont = .systemLarge
            newStyle.placeeholderTextColor = .lightGray
            newStyle.allignment = .center
            newStyle.isUppercased = false
            
            return newStyle
        // MARK: DefaultTextFieldHeader
        case .DefaultTextFieldHeader:
            let newStyle = Style(name: self.rawValue,
                                 isStylable: false,
                                 isTextStylable: true,
                                 isPlaceholderStylable: false)
            // Text Stylable
            // Sets font, text color, allignment and can uppercase the current text of the component
            newStyle.font = .systemMedium
            newStyle.textColor = .marine
            newStyle.allignment = .left
            newStyle.isUppercased = true
            
            return newStyle
        // MARK: DefaultTextField
        case .DefaultTextField:
            let newStyle = Style(name: self.rawValue,
                                 isStylable: true,
                                 isTextStylable: true,
                                 isPlaceholderStylable: true)
            
            // (You can remove any of the values below if you dont't need them for this style)
            
            // Background Stylable
            // Set you backround style properties here
            // Note: You can set corner radius and shadow at the same time on a UIView,
            // but not any other sub classes. You can ofcourse choose one of the two on
            // the sub classes
            newStyle.backgroundColor = .textFieldbackground
            newStyle.borderColor = .textFieldBorder
            newStyle.borderWidth = 1
            newStyle.cornerRadius = .value(5)
            
            // Text Stylable
            // Sets font, text color, allignment and can uppercase the current text of the component
            newStyle.font = .systemMedium
            newStyle.textColor = .marine
            newStyle.allignment = .left
            newStyle.isUppercased = false
            
            // PlaceholderStylable
            // Sets font, text color, allignment and can uppercase the current
            // placeholder text of the component
            
            newStyle.placeholderFont = .systemMedium
            newStyle.textColor = .lightGray
            newStyle.allignment = .center
            newStyle.isUppercased = false
            
            return newStyle
        case .continueButton:
            let newStyle = Style(name: self.rawValue,
                                 isStylable: true,
                                 isTextStylable: true,
                                 isPlaceholderStylable: false)
            
            // (You can remove any of the values below if you dont't need them for this style)
            
            // Background Stylable
            // Set you backround style properties here
            // Note: You can set corner radius and shadow at the same time on a UIView,
            // but not any other sub classes. You can ofcourse choose one of the two on
            // the sub classes
            newStyle.backgroundColor = .projectOrange
            newStyle.cornerRadius = .roundedSideHorizontal
            
            // Text Stylable
            // Sets font, text color, allignment and can uppercase the current text of the component
            newStyle.font = .systemMedium
            newStyle.textColor = .white
            newStyle.allignment = .center
            newStyle.isUppercased = true
            
            return newStyle
        }
    }
}

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
    let name: String
    
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
    
    init(name: String, isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        self.name = name
        self.isStylable = isStylable
        self.isTextStylable = isTextStylable
        self.isPlaceholderStylable = isPlaceholderStylable
    }
}
