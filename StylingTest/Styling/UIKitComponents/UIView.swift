//
//  UIView.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

// List of thing to improve or add
// TODO: Add translation keys as IBInspectable on Labels
// TODO: Checkout Text View posibilities
// TODO: See how much we could style a collection view/ layout or tableview
// ...

extension UIView: Stylable, BackgroundStylable {
    
    /// IBInspectable to access styling from the Interface builder
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
    
    /// Function to start styling this view by giving a style name.
    /// Override this function in new UIKit components to apply the different types
    /// of styles
    ///
    /// - Parameter name: the style name as defined in the Styles enums rawValue
    @objc func style(with name: String) {
        guard let style = Styles(rawValue: name)?.style else {
            print("WARNING: No style found named: \(name)")
            return
        }
        
        if style.isStylable {
            self.styleBackground(backgroundColor: style.backgroundColor,
                                 borderColor: style.borderColor,
                                 borderWidth: style.borderWidth,
                                 cornerRadius: style.cornerRadius,
                                 shadowColor: style.shadowColor,
                                 shadowOffset: style.shadowOffset,
                                 shadowOpacity: style.shadowOpacity,
                                 clipsToBounds: style.clipsToBounds)
        }
    }
    
    /// Convenience method to use for developers
    func style(with style: Styles) {
        self.style(with: style.rawValue)
    }
    
    /// Function to style this views background and border
    ///
    /// This function might ignore the user selected clipsToBounds.
    /// When setting a corner radius we need to set clipsToBound to true
    /// otherwise the corner radius will not be visible
    ///
    /// WARNING: Setting both shadow and corner radius will only work on standard UIView
    func styleBackground(backgroundColor: UIColor? = nil,
                         borderColor: UIColor? = nil,
                         borderWidth: CGFloat? = nil,
                         cornerRadius: RoundingStyle = .none,
                         shadowColor: UIColor? = nil,
                         shadowOffset: CGSize? = nil,
                         shadowOpacity: Float? = nil,
                         clipsToBounds: Bool? = true)
    {
        // Setting user defined clips to bounds, might get overwritten when setting corner radius
        // or shadow
        if let clipsToBounds = clipsToBounds {
            self.clipsToBounds = clipsToBounds
        }
        
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
}
