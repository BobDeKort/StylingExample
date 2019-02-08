//
//  Extensions.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: - Project defined colors -
    // TODO: Define the colors you will use in the app here
    
    @nonobjc class var marine: UIColor {
        return UIColor(red: 2.0 / 255.0, green: 29.0 / 255.0, blue: 83.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var textFieldErrorBackground: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 232.0 / 255.0, blue: 234.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var textFieldErrorBorder: UIColor {
        return UIColor(red: 245.0 / 255.0, green: 141.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    }
}

extension UIFont {
    
    // MARK: - Project defined fonts
    // TODO: Define the fonts you will use in the app here
    
    @nonobjc class var systemSmall: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    @nonobjc class var systemMedium: UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    @nonobjc class var systemLarge: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
}



