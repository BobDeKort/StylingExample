//
//  Models.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

enum CustomizationOptions: String {
    case translatedText
    case styleName
}

// Define the style names you would like to use here
enum Styles: String {
    case Header1
    case Header2
    case Header3
    case AlertText
}

// Define certain rounding styles you would like to achieve using corner radius
enum RoundingStyle {
    case slightlyRounded
    case circle
    case roundedSideHorizontal
    case roundedSideVertical
    case value(CGFloat)
    case none
}
