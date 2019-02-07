//
//  UILabel+Styling.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

enum CustomizationOptions: String {
    case translatedText
    case styleName
}

extension UILabel {
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if let value = value as? String {
            switch key {
            case CustomizationOptions.styleName.rawValue:
                applyStyle(with: value)
            case CustomizationOptions.translatedText.rawValue:
                setTranslatedText(with: value)
            default:
                super.setValue(value, forUndefinedKey: key)
            }
        } else {
            super.setValue(value, forUndefinedKey: key)
        }
    }
    
    private func applyStyle(with name: String) {
        print("Applying style named: \(name)")
        if let style = Styles.shared.getStyle(with: name) {
            self.font = style.textStyle.font
            self.textColor = style.textStyle.textColor
        }
    }
    
    private func setTranslatedText(with key: String) {
        print("Setting translated text with key: \(key)")
    }
}
