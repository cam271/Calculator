//
//  ViewController.swift
//  Calculator
//
//  Created by Chris on 2/6/17.
//  Copyright © 2017 Chris Messenger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: instnace Variable(s)
    var answer: Double = 0
    enum Operation {
        case add, sub, mult, divide, none
    }
    var operationValue = Operation.none
    
    
    // MARK: Properties
    @IBOutlet weak var result: UITextField!
    
    
    // MARK: default methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Actions
    /* appends digits from button events with the nil-coalescing operator */
    @IBAction func numericButtons(_ sender: UIButton) {
        if result.text == "Error" {
            result.text = ""
        }
        result.text = (result.text ?? "") + (sender.titleLabel?.text ?? "")
    }

    
    // MARK: Operators
    /* sets previous result.text value to answer instance variable
        then clears that value on the screen and we set operationValue to the correct case */
    @IBAction func addition(_ sender: UIButton) {
        answer = Double(result.text!)!
        result.text = ""
        operationValue = Operation.add
    }
    
    @IBAction func subtraction(_ sender: UIButton) {
        answer = Double(result.text!)!
        result.text = ""
        operationValue = Operation.sub
    }
    
    @IBAction func multiplication(_ sender: UIButton) {
        answer = Double(result.text!)!
        result.text = ""
        operationValue = Operation.mult
    }
    
    @IBAction func division(_ sender: UIButton) {
        answer = Double(result.text!)!
        result.text = ""
        operationValue = Operation.divide
    }
    
    
    // Clear the Display Method
    /* Clears all values back to default */
    @IBAction func clearDisplay(_ sender: UIButton) {
        result.text = ""
        answer = 0
        operationValue = Operation.none
    }
    
    
    // Equals Method
    /* based on the operationValue perform the correct operation and display the result */
    @IBAction func equals(_ sender: UIButton) {
        
        if operationValue == Operation.add {
            answer += Double(result.text!)!
            result.text = answer.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(answer)) : String(Double(answer))
            // working on doing this with formating and using scientific notation
            // result.text = answer.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%e", Int(answer)) : String(format: "%e", Double(answer))
        }
        
        if operationValue == Operation.sub {
            answer -= Double(result.text!)!
            result.text = answer.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(answer)) : String(Double(answer))
        }
        
        if operationValue == Operation.mult {
            answer *= Double(result.text!)!
            result.text = answer.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(answer)) : String(Double(answer))
        }
        
        if operationValue == Operation.divide {
            answer /= Double(result.text!)!
            result.text = answer.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(answer)) : String(Double(answer))
            // if this ternary operator is not right then switch it out with this
            //result.text = String(answer)
        }
        
        else if operationValue == Operation.none {
            result.text = "Error"
        }
        
        operationValue = Operation.none

    }
    
    
}
