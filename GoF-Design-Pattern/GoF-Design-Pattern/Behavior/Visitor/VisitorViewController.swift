//
//  VisitorViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

class VisitorViewController: UIViewController {
    
    private let visitor: Visitor = MarketVisitor()
    @IBOutlet weak var visitorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure() {
    }
    
    @IBAction func childButtonDidTap(_ sender: Any) {
        let customer = Child()
        visitorLabel.text = customer.accept(visitor: visitor)
    }
    
    @IBAction func AdultButtonDidTap(_ sender: Any) {
        let customer = Adult()
        visitorLabel.text = customer.accept(visitor: visitor)
    }
    
    @IBAction func elderlyButtonDidTap(_ sender: Any) {
        let customer = Elderly()
        visitorLabel.text = customer.accept(visitor: visitor)
    }
}
