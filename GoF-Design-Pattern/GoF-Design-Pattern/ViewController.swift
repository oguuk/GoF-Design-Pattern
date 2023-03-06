//
//  ViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        LoginSingleton.shared.login(withUserName: IDTextField.text ?? "", password: passwordTextField.text ?? "")
        if LoginSingleton.shared.isLoggedIn {
            guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else { return }
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

