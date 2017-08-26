//
//  NumberCell.swift
//  ReposhTest
//
//  Created by Mikhail Koroteev on 26.08.17.
//  Copyright © 2017 Mikhail Koroteev. All rights reserved.
//

import UIKit

class NumberCell: UITableViewCell {

    var numberLabel = UILabel()
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let label = UILabel()
        label.center = self.center
        label.textAlignment = .center
        self.numberLabel = label
        self.addSubview(label)
    }

    func addDataToNumberCell(number: Int) {
        numberLabel.text = String(number)
    }

}
