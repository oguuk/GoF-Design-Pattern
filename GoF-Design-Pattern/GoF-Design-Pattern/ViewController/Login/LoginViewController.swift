//
//  LoginViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        LoginSingleton.shared.login(withUserName: IDTextField.text ?? "", password: passwordTextField.text ?? "")
        if LoginSingleton.shared.isLoggedIn {
            guard let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") else { return }
            self.navigationController?.pushViewController(menuVC, animated: true)
        }
    }
}

