//
//  UITextView.swift
//  StylingTest
//
//  Created by Bob De Kort on 12/04/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

extension UITextView: TextStylable {
    @objc override func style(with name: String) {
        guard let style = StyleType(rawValue: name)?.style else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        // Applying general styling for UIView
        super.style(with: name)
        
        if style.isTextStylable {
            self.styleText(font: style.font,
                           textColor: style.textColor,
                           allignment: style.allignment,
                           isUppercased: style.isUppercased)
        }
    }
    
    /// Function to style this UITextViews inputted text using the individual attributes supported
    ///
    /// - Parameters:
    ///   - font: The font you want this text views text to appear in
    ///   - textColor: The color you want this text views text to appear in
    ///   - allignment: The text allignment to position the text in this text view
    ///   - isUppercased: Sets the current text in the text view to uppercase if true
    func styleText(font: UIFont?,
                   textColor: UIColor?,
                   allignment: NSTextAlignment?,
                   isUppercased: Bool?)
    {
        self.font = font
        self.textColor = textColor
        if let allignment = allignment {
            self.textAlignment = allignment
        }
        
        if let isUppercased = isUppercased, isUppercased {
            self.text = self.text.uppercased()
        }
    }
}
