//
//  HomeViewController.swift
//  LoginCalculator
//
//  Created by Consultant on 8/28/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBAction func loginAction(_ sender: Any) {
        guard let userName = userNameTextField.text else {
            print("user name error")
            return
        }
        guard let password = passwordTextfield.text else {
            print("password error")
            return
        }
        
        if userName == "admin" && password == "admin" {
            self.performSegue(withIdentifier: "loginToCalculator", sender: nil)
        } else {
            print("login fail")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let viewController =  segue.destination as? ViewController
         
         viewController?.userName = userNameTextField.text
    }
    

}
