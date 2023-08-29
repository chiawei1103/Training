//
//  ViewController.swift
//  LoginCalculator
//
//  Created by Consultant on 8/28/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userName: String?
    enum operatorType {
        case plus
        case minus
        case multiply
        case divide
    }
    
    var subTotal: Int?
    var firstValue: Bool = true
    var lastOperator: operatorType?
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    
    @IBAction func buttonEqualAction(_ sender: Any) {

        var result: Int?
        if let finalOperator = lastOperator {
            switch finalOperator {
            case .plus:
                result = subTotal! + (Int(outputLabel.text ?? "0") ?? 0)
            case .minus:
                result = subTotal! - (Int(outputLabel.text ?? "0") ?? 0)
            case .multiply:
                result = subTotal! * (Int(outputLabel.text ?? "0") ?? 0)
            case .divide:
                result = subTotal! / (Int(outputLabel.text ?? "0") ?? 0)
            }
        }
        
        outputLabel.text = "\(result!)"
        subTotal = nil
        firstValue = true
    }
    @IBAction func buttonPlusAction(_ sender: Any) {
        buttonPlus.isSelected = true
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        if let currentSubTotal = subTotal {
            subTotal = Int(outputLabel.text ?? "0")! + currentSubTotal
         } else {
             subTotal = Int(outputLabel.text ?? "0")!
         }
        lastOperator = .plus
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonMinusAction(_ sender: Any) {
        buttonMinus.isSelected = true
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        if let currentSubTotal = subTotal {
            subTotal = currentSubTotal - Int(outputLabel.text ?? "0")!
         } else {
             subTotal = Int(outputLabel.text ?? "0")!
         }
        lastOperator = .minus
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonMultiplyAction(_ sender: Any) {
        buttonMultiply.isSelected = true
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
        if let currentSubTotal = subTotal {
            subTotal = currentSubTotal * Int(outputLabel.text ?? "0")!
         } else {
             subTotal = Int(outputLabel.text ?? "0")!
         }
        lastOperator = .multiply
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonDivideAction(_ sender: Any) {
        buttonDivide.isSelected = true
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        if let currentSubTotal = subTotal {
            subTotal = currentSubTotal /  Int(outputLabel.text ?? "0")!
         } else {
            subTotal = Int(outputLabel.text ?? "0")!
         }
        lastOperator = .divide
        firstValue = true
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonPercentageAction(_ sender: Any) {
        if let curentSubTotal = subTotal {
            subTotal = curentSubTotal / 100
        } else {
            subTotal = Int(outputLabel.text ?? "0")!
        }
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonPlusMinusAction(_ sender: Any) {
        if let currentSubTotal = subTotal {
            subTotal = -currentSubTotal
        } else {
            subTotal = Int(outputLabel.text ?? "0")!
        }
        outputLabel.text = "\(subTotal!)"
    }
    @IBAction func buttonACAction(_ sender: Any) {
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
//        buttonPlus.isSelected = false
//        buttonMinus.isSelected = false
//        buttonDivide.isSelected = false
//        buttonMultiply.isSelected = false
//        buttonIsSelected(button: buttonPlus, operatorType: .plus)
//        buttonIsSelected(button: buttonMinus, operatorType: .minus)
//        buttonIsSelected(button: buttonDivide, operatorType: .divide)
//        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
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

