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
        // Applying gerenal styling for UIView
        super.style(with: name)
        
        // Applying specific UITextField styling
        guard let style = Styles(rawValue: name) else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        switch style {
        case .Header1:
            self.styleText(font: .systemLarge,
                           textColor: .black,
                           allignment: .center,
                           isUppercased: true)
            self.stylePlaceholderText(font: .systemLarge,
                                      textColor: .marine,
                                      allignment: .center,
                                      isUppercased: true)
        case .Header2:
            self.styleText(font: .systemMedium,
                           textColor: .red,
                           allignment: .right,
                           isUppercased: false)
            self.stylePlaceholderText(font: .systemMedium,
                                      textColor: .orange,
                                      allignment: .right,
                                      isUppercased: false)
        case .Header3:
            self.styleText(font: .systemSmall,
                           textColor: .purple)
        case .AlertText:
            self.styleText(font: .systemSmall,
                           textColor: .red,
                           allignment: .left,
                           isUppercased: true)
        }
    }
    
    /// Function to style this UITextFields inputted text using the individual attributes supported
    ///
    /// - Parameters:
    ///   - font: The font you want this text field text to appear in
    ///   - textColor: The color you want this text field inputted text to appear in
    ///   - allignment: The allignment to position the text in this text field
    ///   - isUppercased: Sets the current text in the text field to uppercase if true
    func styleText(font: UIFont,
                   textColor: UIColor,
                   allignment: NSTextAlignment = .left,
                   isUppercased: Bool = false)
    {
        self.font = font
        self.textColor = textColor
        self.textAlignment = allignment
        
        if isUppercased {
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
    func stylePlaceholderText(font: UIFont,
                              textColor: UIColor,
                              allignment: NSTextAlignment = .left,
                              isUppercased: Bool = false)
    {
        guard var placeholder = self.placeholder else {
            print("WARNING: Can not style placeholder if the is no placeholder text set")
            return
        }
        
        if isUppercased {
            placeholder = placeholder.uppercased()
        }
        
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.font : font,
                         NSAttributedString.Key.foregroundColor: textColor]
        )
        
        self.textAlignment = allignment
    }
}
