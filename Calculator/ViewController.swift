//
//  ViewController.swift
//  Calculator
//
//  Created by HoangHai on 7/27/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceBetweenInputTexfieldAndResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateContraints()
    }
    
    func updateContraints() -> Void {
        let scale = UIScreen.mainScreen().bounds.size.height / 736
        
        distanceBetweenResultLabelAndMiddleView.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenResultLabelAndMiddleView.constant * scale : distanceBetweenResultLabelAndMiddleView.constant * 0.1
        
        distanceBetweenInputTexfieldAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenInputTexfieldAndResultLabel.constant * scale : distanceBetweenInputTexfieldAndResultLabel.constant * 0.1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

