//
//  OperatorButton.swift
//  Calculator
//
//  Created by HoangHai on 7/27/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit

class OperatorButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    func configure() -> Void {
        if tag == 101
        {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 0.9)
        } else {
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 0.9)
        }
        layer.cornerRadius = 9.0
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).CGColor
        layer.shadowOffset = CGSizeMake(5.0, 5.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
    }
    
}
