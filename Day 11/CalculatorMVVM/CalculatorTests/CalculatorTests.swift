//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Consultant on 8/24/23.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    let viewModel = ViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnter() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // fistValue = true
        let inputLabel = "1"
        let outputLabel = "4"
        var expectOutput = "1"
        
        var actualOutput = viewModel.enter(inputValue: inputLabel, outputLabel: outputLabel)
        
        XCTAssertEqual(expectOutput, actualOutput)
        
        
        // firstValue = false
        viewModel.firstValue = false
        actualOutput = viewModel.enter(inputValue: inputLabel, outputLabel: outputLabel)
        expectOutput = "41"
        XCTAssertEqual(expectOutput, actualOutput)
    }
    
    func testCalculate() throws {
        
        // plus
        var lastOperator: OperatorType = .plus
        let outLabel = "4"
        viewModel.subTotal = 6
        
        var actualOutput = viewModel.calaculate(lastOperator: lastOperator, outputLabel: outLabel)
        var expectOutput = 10.0
        XCTAssertEqual(expectOutput, actualOutput)
        
        // minus
        lastOperator = .minus
        viewModel.subTotal = 2
        
        actualOutput = viewModel.calaculate(lastOperator: lastOperator, outputLabel: outLabel)
        
        expectOutput = -2.0
        XCTAssertEqual(expectOutput, actualOutput)
        
        // multiply
        lastOperator = .multiply
        viewModel.subTotal = 2
        
        actualOutput = viewModel.calaculate(lastOperator: lastOperator, outputLabel: outLabel)
        
        expectOutput = 8
        XCTAssertEqual(expectOutput, actualOutput)
        
        // divide
        lastOperator = .divide
        viewModel.subTotal = 2
        
        actualOutput = viewModel.calaculate(lastOperator: lastOperator, outputLabel: outLabel)
        
        expectOutput = 0.5
        XCTAssertEqual(expectOutput, actualOutput)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
