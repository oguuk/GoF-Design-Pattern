//
//  IteratorViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import UIKit

class IteratorViewController: UIViewController {
    
    var iterator = Collection(collection: [])
    
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func makeIteratorButtonDidTap(_ sender: Any) {
        var newText = inputTextField.text?.components(separatedBy: ["[", "]", ",", " "])
        let newArr = newText?.compactMap { Int(String($0)) } ?? []
        iterator = Collection(collection: newArr)
    }
    
    @IBAction func nextButtonDidtap(_ sender: Any) {
        let num = iterator.next()
        presentLabel.text = "\(num ?? "")"
    }
    
    @IBAction func prevButtonDidTap(_ sender: Any) {
        let num = iterator.prev()
        presentLabel.text = "\(num ?? "")"
    }
    
}
