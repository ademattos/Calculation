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
    @IBOutlet var score: UILabel!
    @IBOutlet var QNum: UILabel!
    @IBOutlet var textField: UITextField!
    
    /*
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
 */
    
    func calculcation(_ value: Int) -> Int {
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
        
        return answer
        
        /*
        if value == answer {
            return true
        } else {
            return false
        }
 */
    }
    
    var currentQuestionIndex = 1
    var quizScore = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex < 11 {
            QNum.text = "Question: \(currentQuestionIndex)"
            num1.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
            num2.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
            symbol.text = opertaions[Int(arc4random_uniform(4))]
        } else {
            switch quizScore {
            case 60:
                score.text = "60%, failed"
            case 70:
                score.text = "70%, Passed with a C"
            case 80:
                score.text = "80%, Congrats on the B"
            case 90:
                score.text = "90%, You got an A!"
            case 100:
                score.text = "100%, Perfect Score!!"
            default:
                score.text = "Grade lower than 60%"
            }
            print("Quiz Over")
        }
        textField.text = ""
    }
    
    @IBAction func restart(_ sender: UIButton){
        currentQuestionIndex = 1
        quizScore = 0
        score.text = "Score"
        check.text = "Correct/Incorrect"
        textField.text = ""
        QNum.text = "Question: \(currentQuestionIndex)"
        num1.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
        num2.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
        symbol.text = opertaions[Int(arc4random_uniform(4))]
    }
    
    @IBAction func submit(_ sender: UIButton){
        if let text = textField.text, let value = Int(text){
            let switchs = calculcation(value)
            if value == switchs {
                quizScore += 10
                check.text = "Correct"
                score.text = "\(quizScore)/\(currentQuestionIndex)0"
            }else {
                check.text = "Incorrect, answer is \(switchs)"
                score.text = "\(quizScore)/\(currentQuestionIndex)0"
            }
        }
    }
    
    let opertaions: [String] = [
    "*", "+", "/", "-"]
    
    var currentOperationIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        QNum.text = "Question: \(currentQuestionIndex)"
        num1.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
        num2.text = String(Int(arc4random_uniform(UInt32(20 - (-10) + 1))) + (-10))
        symbol.text = opertaions[Int(arc4random_uniform(4))]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "-0123456789.")
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

