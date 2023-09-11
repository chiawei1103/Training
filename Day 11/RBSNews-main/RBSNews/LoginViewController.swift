//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    let loginViewModel = LoginViewModel()
    
//    let expectedUsername = "rbs"
//    let expectedPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen"
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {

        guard let userName = usernameTextField.text, let password = passwordTextField.text else { return }
        
        let result = loginViewModel.validateCredentials(userName: userName, password: password)
        
        if let alertString = result {
            Utility.shared.showAlert(self, "Alert!", alertString)
        } else {
            navigateToHomeScreen()
        }
        
//        loginViewModel.validateCredentials(userName: userName, password: password) { alertString in
//            if let alertString {
//                Utility.shared.showAlert(self, "Alert!", alertString)
//            } else {
//                navigateToHomeScreen()
//            }
//        }
    }
    
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true)
            }
        }
    }
}

