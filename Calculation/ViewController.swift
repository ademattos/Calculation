//
//  ViewController.swift
//  Calculation
//
//  Created by Anthony DeMattos on 2/19/19.
//  Copyright © 2019 Anthony DeMattos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var num1: UILabel!
    @IBOutlet var num2: UILabel!
    @IBOutlet var symbol: UILabel!
    @IBOutlet var check: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func checkingIfAnswerIsCorrect(_ textField: UITextField){
        if let text = textField.text, let value = Int(text){
            let switchs = calculcation(value)
            if switchs == true {
                check.text = "Correct"
            }else {
                check.text = "Incorrect"
            }
        }
    }
    
    func calculcation(_ value: Int) -> Bool{
        let number1 = Int(num1.text!)
        let number2 = Int(num2.text!)
        let operation = Character(symbol.text!)
        var answer = 0
        if operation == "+" {
            answer = number1! + number2!
        } else if operation == "-" {
            answer = number1! - number2!
        } else if operation == "*" {
            answer = number1! * number2!
        } else if operation == "/" {
            answer = number1! / number2!
        }
        
        if value == answer {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func submit(_ sender: UIButton){
        if let text = textField.text, let value = Int(text){
            let switchs = calculcation(value)
            if switchs == true {
                check.text = "Correct"
            }else {
                check.text = "Incorrect"
            }
        }
        
        num1.text = String(arc4random_uniform(99))
        num2.text = String(arc4random_uniform(99))
        currentOperationIndex += 1
        if currentOperationIndex == opertaions.count {
            currentOperationIndex = 0
        }
        symbol.text = opertaions[currentOperationIndex]
    }
    
    let opertaions: [String] = [
    "*", "+", "/", "-"]
    
    var currentOperationIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        num1.text = String(arc4random_uniform(99))
        num2.text = String(arc4random_uniform(99))
        symbol.text = opertaions[currentOperationIndex]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        
        if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet){
            print("Rejected (Invalid Character)")
            return false
        }
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        
        if existingTextHasDecimalSeperator != nil, replacementTextHasDecimalSeperator != nil {
            return false
        }
        else {
            return true
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }

}

