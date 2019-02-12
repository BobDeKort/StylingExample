//
//  UILabel+Translation.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/12/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    /// IBInspectable to access translation from the Interface builder
    @IBInspectable var translationKey: String? {
        get {
            return self.translationKey
        }
        
        set {
            if let key = newValue {
                self.setTranslation(with: key)
            }
        }
    }
    
    func setTranslation(with key: String) {
        
    }
}
