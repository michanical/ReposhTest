//
//  MainView.swift
//  ReposhTest
//
//  Created by Mikhail Koroteev on 26.08.17.
//  Copyright © 2017 Mikhail Koroteev. All rights reserved.
//

import UIKit

class MainView: UIView {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!

    @IBOutlet weak var sumLabel: UILabel!
    
    func setSumNumber(number: Int) {
        self.sumLabel.text = String(number)
    }
}
