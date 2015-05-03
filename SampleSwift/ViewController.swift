//
//  ViewController.swift
//  SampleSwift
//
//  Created by Wasupol Tungsakultong on 4/28/2558 BE.
//  Copyright (c) 2558 Wasupol Tungsakultong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    var isUserTypingNumber = false
    var oprandStack = [Double]()
    
    var displayValue : Double {
        get {
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue;
        }
        set {
            displayLabel.text = "\(newValue)"
            isUserTypingNumber = false;
        }
    }
    
    @IBAction func appendTextDisplay(sender: UIButton) {
        let number = sender.currentTitle!
        if isUserTypingNumber {
            displayLabel.text = displayLabel.text! + number
        } else {
            displayLabel.text = number
            isUserTypingNumber = true
        }
    }
    
    @IBAction func enter() {
        isUserTypingNumber = false;
        oprandStack.append(displayValue)
        println("oprandStack = \(oprandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if isUserTypingNumber {
            enter()
        }
        switch operation {
        case "×" : performBinaryOperation { $0 * $1 }
        case "÷" : performBinaryOperation { $1 / $0 }
        case "+" : performBinaryOperation { $0 + $1 }
        case "-" : performBinaryOperation { $1 - $0 }
        case "√" : performOperation { sqrt($0) }
        default : break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func performBinaryOperation(operation : (Double, Double) -> Double) {
        if oprandStack.count >= 2 {
            displayValue = operation(oprandStack.removeLast(), oprandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation : Double -> Double) {
        if oprandStack.count >= 1 {
            displayValue = operation(oprandStack.removeLast())
            enter()
        }
    }
    
}