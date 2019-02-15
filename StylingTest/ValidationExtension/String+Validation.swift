//
//  String+Validation.swift
//  StylingTest
//
//  Created by Bob De Kort on 14/02/2019.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation

public enum ValidationExpression: String {
    case email = "\\A[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\z"
}

public extension String {
    
    /**
     Checks if the current string is a valid email address.
     
     - returns: true is the current string is a valid email address, false otherwise
     */
    public var isValidEmailAddress: Bool {
        return self.validate(with: .email)
    }
    
    // Method to validate a string using regular expressions defined in the ValidationExpression enum
    public func validate(with expression: ValidationExpression) -> Bool {
        return self.validate(with: expression.rawValue)
    }
    
    // General method to validate a string using regular expressions passed in as a String
    public func validate(with expression: String) -> Bool {
        return self.range(of: expression,
                          options: .regularExpression) != nil
    }
}
