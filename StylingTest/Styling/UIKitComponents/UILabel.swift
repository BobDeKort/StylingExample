//
//  UILabel+Styling.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UILabel: TextStylable {
    // MARK: - Styling Interface -

    // See UIView extension
    @objc override func style(with name: String) {
        // Applying general styling for UIView
        super.style(with: name)
        
        // Applying specific UIlabel styling
        guard let style = Styles(rawValue: name)?.style else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        // Checkin if style is Text stylable, background styling is handles by the above super.style
        if style.isTextStylable {
            self.styleText(font: style.font,
                           textColor: style.textColor,
                           allignment: style.allignment,
                           isUppercased: style.isUppercased)
        }
    }

    
    // MARK: - Acctual styling methods -
    
    /// Function to style this labels text using the individual attributes supported
    ///
    /// - Parameters:
    ///   - font: The font you want this label text to appear in
    ///   - textColor: The color you want this label's text to appear in
    ///   - allignment: The allignment to position the text in this label
    ///   - isUppercased: Sets the current text in the label to uppercase if true
    func styleText(font: UIFont?,
                   textColor: UIColor?,
                   allignment: NSTextAlignment? = .left,
                   isUppercased: Bool? = false) {
        self.font = font
        self.textColor = textColor
        if let isUppercased = isUppercased, isUppercased {
            self.text = self.text?.uppercased()
        }
        if let allignment = allignment {
            self.textAlignment = allignment
        }
    }
}
