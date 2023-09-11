//
//  ViewController.swift
//  Calculator
//
//  Created by Consultant on 8/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    
    @IBAction func buttonEqualAction(_ sender: Any) {
        let result: Double? = viewModel.calaculate(lastOperator: viewModel.lastOperator, outputLabel: outputLabel.text ?? "0")
        
        outputLabel.text = "\(result!)"
        viewModel.subTotal = nil
        viewModel.firstValue = true
    }
    
    @IBAction func buttonPlusAction(_ sender: Any) {
        resetStyle(exception: .plus)
        
        if !viewModel.firstValue {
            if let currentSubTotal = viewModel.subTotal {
                viewModel.subTotal = currentSubTotal +  Double(outputLabel.text ?? "0")!
            } else {
                viewModel.subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        
        viewModel.lastOperator = .plus
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonMinusAction(_ sender: Any) {
        resetStyle(exception: .minus)
        
        if !viewModel.firstValue {
            if let currentSubTotal = viewModel.subTotal {
                viewModel.subTotal = currentSubTotal -  Double(outputLabel.text ?? "0")!
            } else {
                viewModel.subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        viewModel.lastOperator = .minus
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonMultiplyAction(_ sender: Any) {
        resetStyle(exception: .multiply)

        if !viewModel.firstValue {
            if let currentSubTotal = viewModel.subTotal {
                viewModel.subTotal = currentSubTotal *  Double(outputLabel.text ?? "0")!
            } else {
                viewModel.subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        viewModel.lastOperator = .multiply
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonDivideAction(_ sender: Any) {
        resetStyle(exception: .divide)
        
        if !viewModel.firstValue {
            if let currentSubTotal = viewModel.subTotal {
                viewModel.subTotal = currentSubTotal /  Double(outputLabel.text ?? "0")!
            } else {
                viewModel.subTotal = Double(outputLabel.text ?? "0")!
            }
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        viewModel.lastOperator = .divide
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonPercentageAction(_ sender: Any) {
        if let curentSubTotal = Double(outputLabel.text ?? "0") {
            viewModel.subTotal = curentSubTotal / 100
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonPlusMinusAction(_ sender: Any) {
        if let currentSubTotal = Double(outputLabel.text ?? "0") {
            viewModel.subTotal = -currentSubTotal
        } else {
            viewModel.subTotal = Double(outputLabel.text ?? "0")!
        }
        viewModel.firstValue = true
        outputLabel.text = "\(viewModel.subTotal!)"
    }
    @IBAction func buttonACAction(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = "0"
        viewModel.subTotal = nil
        viewModel.firstValue = true
    }
    @IBAction func button1Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "1", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button2Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "2", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button3Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "3", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button4Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "4", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button5Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "5", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button6Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "6", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button7Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "7", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button8Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "8", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button9Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "9", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func button0Action(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: "0", outputLabel: outputLabel.text ?? "")
    }
    @IBAction func buttonDotAction(_ sender: Any) {
        resetStyle(exception: nil)
        outputLabel.text = viewModel.enter(inputValue: ".", outputLabel: outputLabel.text ?? "")
    }
    
    func buttonIsSelected(button: UIButton, operatorType: OperatorType) {
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
    
    func resetStyle(exception: OperatorType?) {
        switch exception {
        case .divide:
            buttonDivide.isSelected = true
            buttonPlus.isSelected = false
            buttonMinus.isSelected = false
            buttonMultiply.isSelected = false
        case .minus:
            buttonPlus.isSelected = false
            buttonMinus.isSelected = true
            buttonDivide.isSelected = false
            buttonMultiply.isSelected = false
        case .multiply:
            buttonPlus.isSelected = false
            buttonMinus.isSelected = false
            buttonDivide.isSelected = false
            buttonMultiply.isSelected = true
        case .plus:
            buttonPlus.isSelected = true
            buttonMinus.isSelected = false
            buttonDivide.isSelected = false
            buttonMultiply.isSelected = false
        default:
            buttonPlus.isSelected = false
            buttonMinus.isSelected = false
            buttonDivide.isSelected = false
            buttonMultiply.isSelected = false
        }
        buttonIsSelected(button: buttonPlus, operatorType: .plus)
        buttonIsSelected(button: buttonMinus, operatorType: .minus)
        buttonIsSelected(button: buttonDivide, operatorType: .divide)
        buttonIsSelected(button: buttonMultiply, operatorType: .multiply)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

