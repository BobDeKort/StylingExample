//
//  Styles.swift
//  StylingTest
//
//  Created by Bob De Kort on 11/04/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

// Define your styles below
enum StyleType: String {
    // 2)
    case exampleStyle
    
    case defaultTextFieldHeader
    case defaultTextField
    
    case continueButton
    case shadowAndRounded
    
    // Define you styles here
    var style: Style {
        // 3)
        switch self {
        case .exampleStyle:             return ExampleStyle()
        case .defaultTextFieldHeader:   return DefaultTextFieldHeader()
        case .defaultTextField:         return DefaultTextField()
        case .continueButton:           return ContinueButton()
        case .shadowAndRounded:         return ShadowAndRounded()
        }
    }
}
