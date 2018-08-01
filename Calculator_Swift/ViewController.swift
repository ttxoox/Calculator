//
//  ViewController.swift
//  Calculator_Swift
//
//  Created by zemel on 2018/7/30.
//  Copyright © 2018年 zemel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //prama MARK:private method
    
    var isInput:Bool = false
    @IBAction func numberHandle(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isInput {
            displayLabel.text = displayLabel.text! + digit
            
        }else{
            displayLabel.text = digit
            isInput = true
        }
    }
    var statementDict = Dictionary<String,String>()
    var numberArray = Array<Double>()
    @IBAction func operateHandle(_ sender: UIButton) {
        isInput = false
        //加入第一个数
        statementDict["operation"] = sender.currentTitle
        numberArray.append(displayValue)
    }
    
    @IBAction func equalHandle() {
        //加入第二个数
        numberArray.append(displayValue)
        if numberArray.count < 2 {
            return;
        }else if numberArray.count > 2{
            numberArray.removeFirst()
        }
        //开始计算
        switch statementDict["operation"] {
        case "x":
//            performOperation(operation: multiply)
            performOperation { (op1, op2) -> Double in
                return op1 * op2
            }
        case "÷":
            performOperation(operation: devide)
        case "-":
            performOperation(operation: reduce)
        case "+":
            performOperation(operation: add)
        default:
            print("Value is nil")
        }
        print(numberArray)
        print(statementDict)
        numberArray.removeAll()
        isInput = false
        
    }
    
    @IBAction func clearHandle() {
        displayLabel.text = "0"
        numberArray.removeAll()
        isInput = false
    }
    @IBAction func nagativeHandle(_ sender: UIButton) {
        numberArray.append(displayValue)
        displayValue = -(numberArray.last!)
        
    }
    @IBAction func percentHandle() {
        numberArray.append(displayValue)
        displayValue = (numberArray.last!)/100
    }
    
    func performOperation (operation:(Double,Double)->Double){
        displayValue = operation(numberArray.first!,numberArray.last!)
        
    }
    func multiply(op1:Double,op2:Double) -> Double {
        return op1 * op2
    }
    func devide(op1:Double,op2:Double) -> Double {
        return op1 / op2
    }
    func add(op1:Double,op2:Double) -> Double {
        return op1 + op2
    }
    func reduce(op1:Double,op2:Double) -> Double {
        return op1 - op2
    }
    var displayValue:Double{
        set{
            displayLabel.text = "\(newValue)"
        }
        get{
            return NumberFormatter().number(from: displayLabel.text!)!.doubleValue
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

