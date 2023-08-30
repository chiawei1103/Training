//
//  ViewController.swift
//  Calculator
//
//  Created by Consultant on 8/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum operatorType {
        case plus
        case minus
        case multiply
        case divide
    }
    
    var subTotal: Double?
    var firstValue: Bool = true
    var lastOperator: operatorType?
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    
    func calaculate(lastOperator: operatorType?) -> Double? {
        if let finalOperator = lastOperator {
            switch finalOperator {
            case .plus:
                return subTotal! + (Double(outputLabel.text ?? "0") ?? 0)
            case .minus:
                return subTotal! - (Double(outputLabel.text ?? "0") ?? 0)
            case .multiply:
                return subTotal! * (Double(outputLabel.text ?? "0") ?? 0)
            case .divide:
                return subTotal! / (Double(outputLabel.text ?? "0") ?? 0)
            }
        } else {
            return 0
        }
    }
    
    @IBAction func buttonEqualAction(_ sender: Any) {

        var result: Double? = calaculate(lastOperator: lastOperator)
//        if let finalOperator = lastOperator {
//            switch finalOperator {
//            case .plus:
//                result = subTotal! + (Double(outputLabel.text ?? "0") ?? 0)
//            case .minus:
//                result = subTotal! - (Double(outputLabel.text ?? "0") ?? 0)
//            case .multiply:
//                result = subTotal! * (Double(outputLabel.text ?? "0") ?? 0)
//            case .divide:
//                result = subTotal! / (Double(outputLabel.text ?? "0") ?? 0)
//            }
//        }
        
        outputLabel.text = "\(result!)"
        subTotal = nil
        firstValue = true
    }
    @IBAction func buttonPlusAction(_ sender: Any) {
        buttonPlus.isSelected = true
        buttonMinus.isSelected = false
        buttonDivide.isSelected = false
        buttonMultiply.isSelected = false
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        
        if !firstValue {
            if let currentSubTotal = subTotal {
                subTotal = currentSubTotal +  Double(outputLabel.text ?? "0")!
            } else {
                subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        
        lastOperator = .plus
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonMinusAction(_ sender: Any) {
        buttonMinus.isSelected = true
        buttonPlus.isSelected = false
        buttonDivide.isSelected = false
        buttonMultiply.isSelected = false
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        
        if !firstValue {
            if let currentSubTotal = subTotal {
                subTotal = currentSubTotal -  Double(outputLabel.text ?? "0")!
            } else {
                subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        lastOperator = .minus
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonMultiplyAction(_ sender: Any) {
        buttonMultiply.isSelected = true
        buttonPlus.isSelected = false
        buttonMinus.isSelected = false
        buttonDivide.isSelected = false
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)

        if !firstValue {
            if let currentSubTotal = subTotal {
                subTotal = currentSubTotal *  Double(outputLabel.text ?? "0")!
            } else {
                subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        lastOperator = .multiply
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonDivideAction(_ sender: Any) {
        buttonDivide.isSelected = true
        buttonPlus.isSelected = false
        buttonMinus.isSelected = false
        buttonMultiply.isSelected = false
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        
        if !firstValue {
            if let currentSubTotal = subTotal {
                subTotal = currentSubTotal /  Double(outputLabel.text ?? "0")!
            } else {
                subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        lastOperator = .divide
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonPercentageAction(_ sender: Any) {
        if let curentSubTotal = Double(outputLabel.text ?? "0") {
            subTotal = curentSubTotal / 100
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonPlusMinusAction(_ sender: Any) {
        if let currentSubTotal = Double(outputLabel.text ?? "0") {
            subTotal = -currentSubTotal
        } else {
            subTotal = Double(outputLabel.text ?? "0")!
        }
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonACAction(_ sender: Any) {
        buttonPlus.isSelected = false
        buttonMinus.isSelected = false
        buttonDivide.isSelected = false
        buttonMultiply.isSelected = false
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        outputLabel.text = "0"
        subTotal = nil
        firstValue = true
    }
    @IBAction func button1Action(_ sender: Any) {
        enter(inputValue: "1")
    }
    @IBAction func button2Action(_ sender: Any) {
        enter(inputValue: "2")
    }
    @IBAction func button3Action(_ sender: Any) {
        enter(inputValue: "3")
    }
    @IBAction func button4Action(_ sender: Any) {
        enter(inputValue: "4")
    }
    @IBAction func button5Action(_ sender: Any) {
        enter(inputValue: "5")
    }
    @IBAction func button6Action(_ sender: Any) {
        enter(inputValue: "6")
    }
    @IBAction func button7Action(_ sender: Any) {
        enter(inputValue: "7")
    }
    @IBAction func button8Action(_ sender: Any) {
        enter(inputValue: "8")
    }
    @IBAction func button9Action(_ sender: Any) {
        enter(inputValue: "9")
    }
    @IBAction func button0Action(_ sender: Any) {
        enter(inputValue: "0")
    }
    @IBAction func buttonDotAction(_ sender: Any) {
        enter(inputValue: ".")
    }
    
    func enter(inputValue: String) {
        buttonPlus.isSelected = false
        buttonMinus.isSelected = false
        buttonDivide.isSelected = false
        buttonMultiply.isSelected = false
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        
        if firstValue {
            outputLabel.text = inputValue
            firstValue = false
        } else {
            outputLabel.text = (outputLabel.text ?? "") + inputValue
        }
    }
    
    func buttonIsSelected(button: UIButton, operatorType: operatorType) {
        if button.isSelected {
            button.backgroundColor = .white
            let image = UIImage(systemName: "\(operatorType)")?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
            button.setImage(image, for: .normal)
        } else {
            button.backgroundColor = .systemOrange
            let image = UIImage(systemName: "\(operatorType)")?.withTintColor(.white, renderingMode: .alwaysOriginal)
            button.setImage(image, for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

