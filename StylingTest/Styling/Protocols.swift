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
    func style(with name: String)
    func setValue(_ value: Any?, forUndefinedKey key: String)
}

protocol TextStylable {
    func styleText(font: UIFont, textColor: UIColor, allignment: NSTextAlignment, isUppercased: Bool)
}

protocol BackgroundStylable {
    func styleBackground(backgroundColor: UIColor,
                         borderColor: UIColor?,
                         borderWidth: CGFloat?,
                         cornerRadius: RoundingStyle,
                         shadowColor: UIColor?,
                         shadowOffset: CGSize?,
                         shadowOpacity: Float?,
                         clipsToBounds: Bool)
}

