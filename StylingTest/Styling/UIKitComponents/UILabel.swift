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

    @objc override func style(with name: String) {
        // Applying general styling for UIView
        super.style(with: name)
        
        // Applying specific UIlabel styling
        guard let style = Styles(rawValue: name) else {
            print("No style found named: \(name)")
            return
        }
        
        switch style {
        case .Header1:
            self.styleText(font: .systemLarge, textColor: .marine, allignment: .left)
        case .Header2:
            self.styleText(font: .systemMedium, textColor: .red, isUppercased: true)
        case .Header3:
            self.styleText(font: .systemMedium, textColor: .green, allignment: .center)
        case .AlertText:
            self.styleText(font: .systemSmall, textColor: .black, allignment: .right)
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
    func styleText(font: UIFont,
                   textColor: UIColor,
                   allignment: NSTextAlignment = .left,
                   isUppercased: Bool = false) {
        self.font = font
        self.textColor = textColor
        if isUppercased {
            self.text = self.text?.uppercased()
        }
        self.textAlignment = allignment
    }
}
