//
//  ViewController.swift
//  Calculator
//
//  Created by HoangHai on 7/27/16.
//  Copyright © 2016 Son T Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceBetweenInputTextfieldAndResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleView: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextfield: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //Varibles
    var isTappingNumber : Bool = false
    var isEndOperation : Bool = true
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    
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
        
        distanceBetweenInputTextfieldAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenInputTextfieldAndResultLabel.constant * scale : distanceBetweenInputTextfieldAndResultLabel.constant * 0.1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Action
    
    @IBAction func numberAction(sender: UIButton) {
        
        let number = sender.currentTitle
        
        if isTappingNumber {
            inputTextfield.text = inputTextfield.text! + number!
        } else {
            inputTextfield.text = number
            isTappingNumber = true
        }
        
    }
    
    @IBAction func operatorAction(sender: UIButton) {
        
        operation = sender.currentTitle!
        
        if let inputOperation = Double(inputTextfield.text!){
            
            if isEndOperation {
                firstNumber = inputOperation
                isEndOperation = false
            } else {
                firstNumber = Double(resultLabel.text!)!
                inputTextfield.text = "\(firstNumber)"
            }

        } else {
            print("Nhap so di da ngu the")
        }
        
        isTappingNumber = false
        
        if operation == "%" {
            resultAction(sender)
        } else if operation == "+/-"{
            resultAction(sender)
        }
    }
    
    @IBAction func resultAction(sender: UIButton) {
        
        isTappingNumber = false
        
        var result : Double = 0
        
        if let realSecondNumber = Double(inputTextfield.text!) {
            secondNumber = realSecondNumber
        }
        
        switch operation {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "*":
                result = firstNumber * secondNumber
            case "/":
                result = firstNumber / secondNumber
            case "%":
                result = firstNumber / 100
            case "+/-":
                if firstNumber < 0 {
                    firstNumber = fabs(firstNumber)
                    result = firstNumber
                } else {
                    firstNumber = -1 * firstNumber
                    result = firstNumber
                }
                inputTextfield.text = "\(result)"
        default:
                print("Error Operation")
        }
        
        resultLabel.text = "\(result)"
    }
    
    @IBAction func resetAction(sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        inputTextfield.text = ""
        resultLabel.text = "0"
        isEndOperation = true
    }
}

