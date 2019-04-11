//
//  Protocols.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

// Methods needed to style UIKit components
protocol Stylable {
    // Properties
    var styleName: String? { get set }
    
    // Methods
    func style(with name: String)
    func style(with style: StyleType)
}

protocol TextStylable {
    // Methods
    func styleText(font: UIFont?,
                   textColor: UIColor?,
                   allignment: NSTextAlignment?,
                   isUppercased: Bool?)
}

protocol PlaceholderStylable {
    // Methods
    func stylePlaceholderText(font: UIFont?,
                              textColor: UIColor?,
                              allignment: NSTextAlignment?,
                              isUppercased: Bool?)
}

protocol BackgroundStylable {
    // Methods
    func styleBackground(backgroundColor: UIColor?,
                         borderColor: UIColor?,
                         borderWidth: CGFloat?,
                         cornerRadius: RoundingStyle,
                         shadowColor: UIColor?,
                         shadowOffset: CGSize?,
                         shadowOpacity: Float?,
                         clipsToBounds: Bool?)
}
