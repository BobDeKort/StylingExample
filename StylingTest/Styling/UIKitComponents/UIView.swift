//
//  UIView.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

// TODO: Checkout Text field and text view
// TODO: See how much we could style a collection view/ layout

extension UIView: Stylable, BackgroundStylable {
    
    @IBInspectable var styleName: String? {
        get {
            return self.styleName
        }
        
        set {
            if let name = newValue {
                self.style(with: name)
            }
        }
    }
    
    // Intercepting User defined runtime properties
    open override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if let value = value as? String {
            switch key {
            case CustomizationOptions.styleName.rawValue:
                style(with: value)
            case CustomizationOptions.translatedText.rawValue:
                setTranslatedText(with: value)
                break
            default:
                super.setValue(value, forUndefinedKey: key)
            }
        } else {
            super.setValue(value, forUndefinedKey: key)
        }
    }
    
    /// Function to start styling this view by giving a style name.
    /// Override this function in new UIKit components to apply the different types
    /// of styles
    ///
    /// - Parameter name: the style name as defined in the Styles enums rawValue
    @objc func style(with name: String) {
        guard let style = Styles(rawValue: name) else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        switch style {
        // TODO: Add styling here
        case .Header1:
            self.styleBackground(backgroundColor: .green,
                                 borderColor: .red,
                                 borderWidth: 5,
                                 cornerRadius: .roundedSideHorizontal)
        case .Header2:
            self.styleBackground(backgroundColor: .gray,
                                 borderColor: .blue,
                                 borderWidth: 2,
                                 shadowColor: .darkGray,
                                 shadowOffset: CGSize(width: 1, height: 3),
                                 shadowOpacity: 1)
        case .Header3:
            self.styleBackground(backgroundColor: .purple,
                                 borderColor: nil,
                                 borderWidth: nil,
                                 cornerRadius: .circle)
        case .AlertText:
            self.styleBackground(backgroundColor: .textFieldErrorBackground,
                                 borderColor: .textFieldErrorBorder,
                                 borderWidth: 2,
                                 cornerRadius: .value(20))
        }
    }
    
    /// Function to style this views background and border
    ///
    /// This function might ignore the user selected clipsToBounds.
    /// When setting a corner radius we need to set clipsToBound to true
    /// otherwise the corner radius will not be visible
    ///
    /// WARNING: Setting both shadow and corner radius will not work on UILabels, ...
    /// - Parameters:
    ///   - color: The background color for this view
    ///   - borderColor: The border color for this view
    ///   - borderWidth: The border width for this view
    ///   - clipsToBounds: Set the clipsToBounds property of this view
    func styleBackground(backgroundColor: UIColor,
                         borderColor: UIColor?,
                         borderWidth: CGFloat?,
                         cornerRadius: RoundingStyle = .none,
                         shadowColor: UIColor? = nil,
                         shadowOffset: CGSize? = nil,
                         shadowOpacity: Float? = nil,
                         clipsToBounds: Bool = true)
    {
        // Setting user defined clips to bounds, might get overwritten when setting corner radius
        // or shadow
        self.clipsToBounds = clipsToBounds
        
        // Set background color
        self.backgroundColor = backgroundColor
        
        // Set border style
        if let borderWidth = borderWidth, let borderColor = borderColor {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
        
        // Getting righ corner Radius value
        var cornerRadiusValue: CGFloat?
        switch cornerRadius {
        case .slightlyRounded:
            // Hard coded value for the slightly rounded case
            cornerRadiusValue = 5
        case .circle, .roundedSideHorizontal:
            cornerRadiusValue = self.frame.height / 2
        case .roundedSideVertical:
            cornerRadiusValue = self.frame.width / 2
        case let .value(radius):
            cornerRadiusValue = radius
        case .none: break
        }
        
        // Setting both corner radius and shadow
        if
            let cornerRadiusValue = cornerRadiusValue,
            let shadowColor = shadowColor,
            let shadowOffset = shadowOffset,
            let shadowOpacity = shadowOpacity
        {
            self.layer.setShadowAndCornerRadius(cornerRadius: cornerRadiusValue,
                                                shadowColor: shadowColor,
                                                shadowOffset: shadowOffset,
                                                shadowOpacity: shadowOpacity)
        // Setting only corner radius
        } else if let cornerRadiusValue = cornerRadiusValue {
            self.clipsToBounds = true
            self.layer.cornerRadius = cornerRadiusValue
        // Setting only shadow
        } else if let shadowColor = shadowColor,
            let shadowOffset = shadowOffset,
            let shadowOpacity = shadowOpacity
        {
            self.clipsToBounds = false
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    // MARK: - Translations -
    
    private func setTranslatedText(with key: String) {
        print("Setting translated text with key: \(key)")
    }
}
