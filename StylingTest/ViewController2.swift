//
//  ViewController2.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/12/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

// Example of how you would recreate the first view controller in code

class ViewController2: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var familyTextField: UITextField!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var postcodeLabel: UILabel!
    @IBOutlet weak var postCodeTextField: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // General style method
        styleWithStyles()
//        styleWithAttributes()
    }
    
    // Example of styling components in code using predefined styles
    private func styleWithStyles() {
        headerLabel.style(with: .exampleStyle)
        
        [emailLabel, firstNameLabel, familyNameLabel,
         addressLabel, postcodeLabel, cityLabel].forEach { (label) in
            label?.style(with: .defaultTextFieldHeader)
        }
        
        [emailTextField, firstNameTextField, familyTextField,
         addressTextField, postCodeTextField, cityTextField].forEach { (textField) in
            textField?.style(with: Styles.defaultTextField)
        }
        
        continueButton.style(with: .continueButton)
    }
    
    // Example of styling components in code using specific attributes
    private func styleWithAttributes() {
        headerLabel.styleText(font: .systemLarge,
                              textColor: .marine,
                              allignment: .center,
                              isUppercased: false)
        
        [emailLabel, firstNameLabel, familyNameLabel,
         addressLabel, postcodeLabel, cityLabel].forEach { (label) in
            label?.styleText(font: .systemMedium,
                            textColor: .marine,
                            allignment: .left,
                            isUppercased: true)
        }
        
        [emailTextField, firstNameTextField, familyTextField,
         addressTextField, postCodeTextField, cityTextField].forEach { (textField) in
            textField?.styleText(font: .systemMedium,
                                 textColor: .marine,
                                 allignment: .left,
                                 isUppercased: false)
            textField?.stylePlaceholderText(font: .systemMedium,
                                            textColor: .lightGray,
                                            allignment: .left,
                                            isUppercased: false)
        }
        
        continueButton.styleBackground(backgroundColor: .projectOrange,
                                       cornerRadius: .roundedSideHorizontal)
        continueButton.styleText(font: .systemMedium,
                                 textColor: .white,
                                 allignment: .center,
                                 isUppercased: true)
    }
}
