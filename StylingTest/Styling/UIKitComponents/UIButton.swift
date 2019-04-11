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
    
    // See UIView extension
    @objc override func style(with name: String) {
        guard let style = Styles(rawValue: name)?.style else {
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
    
    func styleText(font: UIFont?,
                   textColor: UIColor?,
                   allignment: NSTextAlignment? = .left,
                   isUppercased: Bool? = false)
    {
        // TODO: Use attributes String for title?
        
        self.titleLabel?.font = font
        self.setTitleColor(textColor, for: .normal)
        
        if let allignment = allignment {
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
        }
        
        if let isUppercased = isUppercased, isUppercased {
            self.setTitle(self.titleLabel?.text?.uppercased(), for: self.state)
        }
    }
}
