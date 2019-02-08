//
//  ViewController.swift
//  StylingTest
//
//  Created by Bob De Kort on 2/7/19.
//  Copyright © 2019 Bob De Kort. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var randomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomView.layer.setShadowAndCornerRadius(cornerRadius: 10,
                                                  shadowColor: .darkGray,
                                                  shadowOffset: CGSize(width: 1, height: 3),
                                                  shadowOpacity: 1)
    }
}

