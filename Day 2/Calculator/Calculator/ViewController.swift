//
//  ViewController.swift
//  Calculator
//
//  Created by Consultant on 8/24/23.
//

import UIKit

class ViewController: UIViewController {
    var input: String = ""
    var calculatorDic = [String: String]()
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBAction func button7Action(_ sender: Any) {
        enter(inputText: "7")
        inputLabel.text = input
    }
    @IBAction func buttonEqualAction(_ sender: Any) {
        let ouputArray = input.components(separatedBy: "+")
        var output = 0
        for item in ouputArray {
            print("item: \(item)")
            output += Int(item) ?? 0
            print("output: \(output)")
            outputLabel.text = String(output)
        }
    }
    @IBAction func buttonPlusAction(_ sender: Any) {
        enter(inputText: "+")
        inputLabel.text = input
        print(buttonPlus.currentTitleColor)
        buttonPlus.isSelected.toggle()
        print("status: \(buttonPlus.state.rawValue)")
        calculatorDic.updateValue(input, forKey: "number")
        calculatorDic.updateValue("+", forKey: "operator")

    }
    @IBAction func buttonMinusAction(_ sender: Any) {
    }
    @IBAction func buttonMultiplyAction(_ sender: Any) {
    }
    @IBAction func buttonDivideAction(_ sender: Any) {
    }
    @IBAction func buttonPercentageAction(_ sender: Any) {
    }
    @IBAction func buttonPlusMinusAction(_ sender: Any) {
    }
    @IBAction func buttonACAction(_ sender: Any) {
        input = ""
        inputLabel.text = "0"
        outputLabel.text = "0"
    }
    @IBAction func button8Action(_ sender: Any) {
        enter(inputText: "8")
        inputLabel.text = input
    }
    @IBAction func button9Action(_ sender: Any) {
        enter(inputText: "9")
        inputLabel.text = input
    }
    @IBAction func button4Action(_ sender: Any) {
        enter(inputText: "4")
        inputLabel.text = input
    }
    @IBAction func button5Action(_ sender: Any) {
        enter(inputText: "5")
        inputLabel.text = input
    }
    @IBAction func button6Action(_ sender: Any) {
        enter(inputText: "6")
        inputLabel.text = input
    }
    @IBAction func button1Action(_ sender: Any) {
        enter(inputText: "1")
        inputLabel.text = input
    }
    @IBAction func button2Action(_ sender: Any) {
        enter(inputText: "2")
        inputLabel.text = input
    }
    @IBAction func button3Action(_ sender: Any) {
        enter(inputText: "3")
        inputLabel.text = input
    }
    @IBAction func button0Action(_ sender: Any) {
        enter(inputText: "0")
        inputLabel.text = input
    }
    @IBAction func buttonDotAction(_ sender: Any) {
        enter(inputText: ".")
        inputLabel.text = input
    }
    
    func enter(inputText: String) {
        input += inputText
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

