//
//  Style.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

public class TextStyle {
    // MARK: - Properties -
    
    private let name: String
    
    public let font: UIFont
    public let textColor: UIColor
    
    // MARK: - Initializers -
    
    internal init(name: String, font: UIFont, textColor: UIColor) {
        self.name = name
        self.font = font
        self.textColor = textColor
    }
}
