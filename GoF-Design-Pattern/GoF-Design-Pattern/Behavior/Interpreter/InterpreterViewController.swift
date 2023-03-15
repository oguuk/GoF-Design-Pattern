//
//  InterpreterViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

class InterpreterViewController: UIViewController {
    
    let intergetContext = IntergerContext()
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func caculateButtonDidTap(_ sender: Any) {
        guard let firstText = firstTextField.text,
              let first = Int(firstText),
              let secondText = secondTextField.text,
              let second = Int(secondText),
              let thirdText = thirdTextField.text,
              let third = Int(thirdText),
              let fourthText = fourthTextField.text,
              let fourth = Int(fourthText) else { return }
        
        let firstVariable = VariableExpression(name: "first")
        let secondVariable = VariableExpression(name: "second")
        let thirdVariable = VariableExpression(name: "third")
        let fourthVariable = VariableExpression(name: "fourth")
        let loop: [(Int, VariableExpression)] = [(first, firstVariable), (second, secondVariable), (third, thirdVariable), (fourth, fourthVariable)]
        loop.forEach {
            intergetContext.setValue($0.0, for: $0.1)
        }
        
        let multuply = MultiplicationExpression(thirdVariable, fourthVariable)
        let add = AddExpression(firstVariable, secondVariable)
        let result = SubstractionExpression(add, multuply).interpreter(intergetContext)
        answerLabel.text = "\(result ?? 0)"
    }
}
