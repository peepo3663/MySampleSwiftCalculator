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
        if let number = sender.currentTitle {
            if isUserTypingNumber {
                displayLabel.text = displayLabel.text! + number
            } else {
                displayLabel.text = number
                isUserTypingNumber = true
            }
        }
    }
    
    @IBAction func enter() {
        isUserTypingNumber = false;
        oprandStack.append(displayValue)
        println("oprandStack = \(oprandStack)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

