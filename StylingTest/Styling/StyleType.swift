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
    // 1)
    case exampleStyle
    
    case defaultTextFieldHeader
    case defaultTextField
    
    case continueButton
    case shadowAndRounded
    
    // Define you styles here
    var style: Style {
        // 2)
        switch self {
        case .exampleStyle:
            return ExampleStyle(isStylable: false,
                                isTextStylable: true,
                                isPlaceholderStylable: false)
        case .defaultTextFieldHeader:
            return DefaultTextFieldHeader(isStylable: false,
                                          isTextStylable: true,
                                          isPlaceholderStylable: false)
        case .defaultTextField:
            return DefaultTextField(isStylable: true,
                                    isTextStylable: true,
                                    isPlaceholderStylable: true)
        case .continueButton:
            return ContinueButton(isStylable: true,
                                  isTextStylable: true,
                                  isPlaceholderStylable: false)
        case .shadowAndRounded:
            return ShadowAndRounded(isStylable: true,
                                    isTextStylable: false,
                                    isPlaceholderStylable: false)
        }
    }
}
