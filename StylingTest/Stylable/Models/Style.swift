//
//  Style.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation

public class Style {
    // MARK: - Properties -
    
    public let name: String
    public let textStyle: TextStyle
    
    // MARK: - Initializers -
    
    internal init(name: String, textStyle: TextStyle) {
        self.name = name
        self.textStyle = textStyle
    }
}
