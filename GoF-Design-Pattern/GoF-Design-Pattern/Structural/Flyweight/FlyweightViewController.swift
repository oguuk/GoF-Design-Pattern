//
//  FlyweightViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

class FlyweightViewController: UIViewController {
    
    var factory: FlyweightFactory = FlyweightFactory()
    @IBOutlet weak var whiteBoardView: UIView!
    @IBOutlet weak var objectNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        guard let name = objectNameTextField.text else { return }
        let weightObject = factory.getWeights(name: name)
        guard let address = weightObject.address else { return }
        let randomX = CGFloat(arc4random_uniform(UInt32(whiteBoardView.bounds.width)))
        let randomY = CGFloat(arc4random_uniform(UInt32(whiteBoardView.bounds.height)))
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "\(address)"
        whiteBoardView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: whiteBoardView.leftAnchor, constant: randomX).isActive = true
        label.centerYAnchor.constraint(equalTo: whiteBoardView.topAnchor, constant: randomY).isActive = true
    }
}
