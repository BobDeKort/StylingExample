//
//  CALayer+Shadow.swift
//  StylingTest
//
//  Created by Bob De Kort on 08/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func setShadowAndCornerRadius(cornerRadius: CGFloat,
                                  shadowColor: UIColor,
                                  shadowOffset: CGSize,
                                  shadowOpacity: Float)
    {
        self.cornerRadius = cornerRadius
        
        let shadowPath = UIBezierPath(rect: self.bounds)
        self.masksToBounds = false
        self.shadowColor = shadowColor.cgColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowPath = shadowPath.cgPath
    }
}
