//
//  ViewModel.swift
//  Calculator
//
//  Created by Lawrence on 9/8/23.
//

import Foundation

enum OperatorType {
    case plus
    case minus
    case multiply
    case divide
}

class ViewModel {
    var subTotal: Double?
    var firstValue: Bool = true
    var lastOperator: OperatorType?
    
    func calaculate(lastOperator: OperatorType?, outputLabel: String) -> Double? {
        if let finalOperator = lastOperator, let subTotal = subTotal {
            switch finalOperator {
            case .plus:
                return subTotal + (Double(outputLabel) ?? 0)
            case .minus:
                return subTotal - (Double(outputLabel) ?? 0)
            case .multiply:
                return subTotal * (Double(outputLabel) ?? 0)
            case .divide:
                guard let outputLabel = Double(outputLabel) else { return 0 }
                return subTotal / outputLabel
            }
        } else {
            return 0
        }
    }
    
    func enter(inputValue: String, outputLabel: String) -> String {
        if firstValue {
            firstValue = false
            return inputValue
        } else {
            return outputLabel + inputValue
        }
    }
}
