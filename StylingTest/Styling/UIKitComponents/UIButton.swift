//
//  UIButton.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UIButton: TextStylable {
    
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
            self.styleText(font: .systemLarge,
                           textColor: .black,
                           allignment: .center,
                           isUppercased: true)
        case .Header2:
            self.styleText(font: .systemMedium,
                           textColor: .red,
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
    
    func styleText(font: UIFont,
                   textColor: UIColor,
                   allignment: NSTextAlignment = .left,
                   isUppercased: Bool = false)
    {
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        
        switch allignment {
        case .left:
            self.contentHorizontalAlignment = .left
        case .center:
            self.contentHorizontalAlignment = .center
        case .right:
            self.contentHorizontalAlignment = .right
        case .natural:
            self.contentHorizontalAlignment = .fill
        default: break
        }
        
        if isUppercased {
            self.setTitle(self.titleLabel?.text?.uppercased(), for: self.state)
        }
    }
}
