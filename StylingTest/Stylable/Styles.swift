//
//  Styles.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import Foundation
import UIKit

enum StylingErrors: Error {
    case NoSuchStyle
}

// Option 1: singleton
//open class Styles {
//    // MARK: - Singleton -
//
//    public static let shared = Styles()
//
//    // MARK: - Properties -
//
//    private var styles = [String: Style]()
//
//    // MARK: - Initializers -
//
//    private init() {
//        // Initializing test styles
//        populateTest()
//    }
//
//    // MARK: - Public methods -
//
//    /*
//     Returns a style stored in the singleton or throws an error
//     */
//    public func getStyle(with name: String) -> Style?  {
//        guard let style = styles[name] else {
//            print("ERROR: Style named \(name) not found")
//            return nil
//        }
//        return style
//    }
//
//    /*
//     Populates the singleton with test styles:
//        - Header 1
//        - Header 2
//        - AlertText
//     */
//    private func populateTest() {
//        self.styles = [
//            "Header1": Style(name: "Header1", textStyle: TextStyle(name: "Header1",
//                                                                   font: .systemFont(ofSize: 25),
//                                                                   textColor: .blue)),
//            "Header2": Style(name: "Header2", textStyle: TextStyle(name: "Header2",
//                                                                   font: .systemFont(ofSize: 18),
//                                                                   textColor: .green)),
//            "AlertText": Style(name: "AlertText", textStyle: TextStyle(name: "AlertText",
//                                                                       font: .systemFont(ofSize: 12),
//                                                                       textColor: .red))
//        ]
//    }
//}

open class Styles {
    // MARK: - Properties -
    
    private var styles: [String: Style] {
        get {
            
            return [String: Style]()
        }
        
        set {
            
        }
    }
    
    // MARK: - Initializers -
    
    private init() {
        // Initializing test styles
        populateTest()
    }
    
    // MARK: - Public methods -
    
    /*
     Returns a style stored in the singleton or throws an error
     */
    public func getStyle(with name: String) -> Style?  {
//        guard let style = styles[name] else {
//            print("ERROR: Style named \(name) not found")
//            return nil
//        }
//        return style
    }
    
    /*
     Populates the singleton with test styles:
     - Header 1
     - Header 2
     - AlertText
     */
    private func populateTest() {
//        self.styles = [
//            "Header1": Style(name: "Header1", textStyle: TextStyle(name: "Header1",
//                                                                   font: .systemFont(ofSize: 25),
//                                                                   textColor: .blue)),
//            "Header2": Style(name: "Header2", textStyle: TextStyle(name: "Header2",
//                                                                   font: .systemFont(ofSize: 18),
//                                                                   textColor: .green)),
//            "AlertText": Style(name: "AlertText", textStyle: TextStyle(name: "AlertText",
//                                                                       font: .systemFont(ofSize: 12),
//                                                                       textColor: .red))
//        ]
    }
}
