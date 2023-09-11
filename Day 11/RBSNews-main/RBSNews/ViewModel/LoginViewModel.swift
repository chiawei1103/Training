//
//  LoginViewModel.swift
//  RBSNews
//
//  Created by Lawrence on 9/8/23.
//

import Foundation

class LoginViewModel {
    private let expectedUsername = "rbs"
    private let expectedPassword = "1234"
    
    func validateCredentials(userName: String, password: String) -> String? {
        if userName.isEmpty || password.isEmpty {
            return "Please input credentials."
        } else if userName != expectedUsername {
            return "Username is invalid"
        } else if password != expectedPassword {
            return "Password is invalid"
        }
        return nil
    }
    
//    func validateCredentials(userName: String, password: String, completionHandler: (String?) -> Void) {
//        if userName.isEmpty || password.isEmpty {
//            completionHandler("Please input credentials.")
//        } else if userName != expectedUsername {
//            completionHandler("Username is invalid")
//        } else if password != expectedPassword {
//            completionHandler("Password is invalid")
//        }
//        completionHandler(nil)
//    }
}
