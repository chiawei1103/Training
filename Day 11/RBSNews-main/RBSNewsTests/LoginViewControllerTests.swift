//
//  LoginViewControllerTests.swift
//  RBSNewsTests
//
//  Created by MAC on 01/12/21.
//

import XCTest
@testable import RBSNews

class LoginViewControllerTests: XCTestCase {

    var loginViewController:LoginViewController!
    var loginViewModel: LoginViewModel!
    
    override func setUpWithError() throws {
        
        loginViewController = LoginViewController()
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
       loginViewController = nil
    }

    
    func testLoginValidation() {
        
        var expectedOutput = "Please input credentials."
       var actualOutput =  loginViewModel.validateCredentials(userName:"", password: "")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        expectedOutput = "Password is invalid"
        actualOutput =  loginViewModel.validateCredentials(userName:"rbs", password: "afasd")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        expectedOutput = "Username is invalid"
        actualOutput =  loginViewModel.validateCredentials(userName:"afa", password: "1234")
        
        
        XCTAssertEqual(expectedOutput, actualOutput)
        
        
        
        actualOutput =  loginViewModel.validateCredentials(userName:"rbs", password: "1234")
        
        
        XCTAssertNil(actualOutput)
    }

}
