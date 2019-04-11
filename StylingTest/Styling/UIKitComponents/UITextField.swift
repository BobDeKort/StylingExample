//
//  UITextField.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/9/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UITextField: TextStylable, PlaceholderStylable {
    
    @objc override func style(with name: String) {
        guard let style = Styles(rawValue: name)?.style else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        // Applying gerenal styling for UIView
        super.style(with: name)
        
        if style.isTextStylable {
            self.styleText(font: style.font,
                           textColor: style.textColor,
                           allignment: style.allignment,
                           isUppercased: style.isUppercased)
        }
        
        if style.isPlaceholderStylable {
            self.stylePlaceholderText(font: style.placeholderFont,
                                      textColor: style.placeeholderTextColor,
                                      allignment: style.placeholderTextAllignment,
                                      isUppercased: style.placeholderIsUppercased)
        }
    }
    
    /// Function to style this UITextFields inputted text using the individual attributes supported
    ///
    /// - Parameters:
    ///   - font: The font you want this text field text to appear in
    ///   - textColor: The color you want this text field inputted text to appear in
    ///   - allignment: The allignment to position the text in this text field
    ///   - isUppercased: Sets the current text in the text field to uppercase if true
    func styleText(font: UIFont?,
                   textColor: UIColor?,
                   allignment: NSTextAlignment? = .left,
                   isUppercased: Bool? = false)
    {
        self.font = font
        self.textColor = textColor
        if let allignment = allignment {
            self.textAlignment = allignment
        }
        
        if let isUppercased = isUppercased, isUppercased {
            self.text = self.text?.uppercased()
        }
    }
    
    /// Function to style this UITextFields current placeholder using individual attributes.
    ///
    /// - Parameters:
    ///   - font: The font you want this placeholder text field text to appear in
    ///   - textColor: The color you want this text field placeholder text to appear in
    ///   - allignment: The allignment to position the text in this text field
    ///   - isUppercased: Sets the current placeholder text in the text field to
    /// uppercase if true
    func stylePlaceholderText(font: UIFont?,
                              textColor: UIColor?,
                              allignment: NSTextAlignment? = .left,
                              isUppercased: Bool? = false)
    {
        guard var placeholder = self.placeholder else {
            print("WARNING: Can not style placeholder if the is no placeholder text set")
            return
        }
        
        if let isUppercased = isUppercased, isUppercased {
            placeholder = placeholder.uppercased()
        }
        
        if let allignment = allignment {
            self.textAlignment = allignment
        }
        
        // Constructing attributes
        var attributes: [NSAttributedString.Key : Any] = [:]
        
        if let font = font {
            attributes[NSAttributedString.Key.font] = font
        }
        
        if let textColor = textColor {
            attributes[NSAttributedString.Key.foregroundColor] = textColor
        }
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: attributes)
    }
}
