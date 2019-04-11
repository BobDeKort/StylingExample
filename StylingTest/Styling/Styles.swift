//
//  Styles.swift
//  StylingTest
//
//  Created by Bob De Kort on 4/11/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

class ExampleStyle: Style {
    override init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        super.init(isStylable: isStylable,
                   isTextStylable: isTextStylable,
                   isPlaceholderStylable: isPlaceholderStylable)
        backgroundColor = .green
        borderColor = .red
        borderWidth = 5
        cornerRadius = .roundedSideHorizontal
        shadowColor = nil
        shadowOffset = nil
        shadowOpacity = nil
        clipsToBounds = true
        
        // Text Stylable
        // Sets font, text color, allignment and can uppercase the current text of the component
        font = .systemLarge
        textColor = .marine
        allignment = .center
        isUppercased = false
        
        // PlaceholderStylable
        // Sets font, text color, allignment and can uppercase the current
        // placeholder text of the component
        
        placeholderFont = .systemLarge
        placeeholderTextColor = .lightGray
        allignment = .center
        isUppercased = false
    }
}

class DefaultTextFieldHeader: Style {
    override init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        super.init(isStylable: isStylable,
                   isTextStylable: isTextStylable,
                   isPlaceholderStylable: isPlaceholderStylable)
        font = .systemMedium
        textColor = .marine
        allignment = .left
        isUppercased = true
    }
}

class DefaultTextField: Style {
    override init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        super.init(isStylable: isStylable,
                   isTextStylable: isTextStylable,
                   isPlaceholderStylable: isPlaceholderStylable)
        
        // Background Stylable
        backgroundColor = .textFieldbackground
        borderColor = .textFieldBorder
        borderWidth = 1
        cornerRadius = .value(5)
        
        // Text Stylable
        // Sets font, text color, allignment and can uppercase the current text of the component
        font = .systemMedium
        textColor = .marine
        allignment = .left
        isUppercased = false
        
        // PlaceholderStylable
        // Sets font, text color, allignment and can uppercase the current
        // placeholder text of the component
        
        placeholderFont = .systemMedium
        textColor = .lightGray
        allignment = .center
        isUppercased = false
    }
}

class ContinueButton: Style {
    override init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        super.init(isStylable: isStylable,
                   isTextStylable: isTextStylable,
                   isPlaceholderStylable: isPlaceholderStylable)
        // Background Stylable
        // Set you backround style properties here
        backgroundColor = .projectOrange
        cornerRadius = .roundedSideHorizontal
        
        // Text Stylable
        // Sets font, text color, allignment and can uppercase the current text of the component
        font = .systemMedium
        textColor = .white
        allignment = .center
        isUppercased = true
    }
}

class ShadowAndRounded: Style {
    override init(isStylable: Bool, isTextStylable: Bool, isPlaceholderStylable: Bool) {
        super.init(isStylable: isStylable,
                   isTextStylable: isTextStylable,
                   isPlaceholderStylable: isPlaceholderStylable)
        shadowColor = .gray
        shadowOffset = CGSize(width: -10, height: 10)
        shadowOpacity = 0.2
        cornerRadius = .value(20)
    }
}
