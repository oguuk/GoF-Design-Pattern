//
//  HomeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

class HomeViewController: UIViewController {
    
    let factory = SymbolFactory()
    
    @IBOutlet weak var symbolImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonDidTap(_ sender: Any) {
        let type = SymbolType.allCases.randomElement()!
        symbolImageView.image = factory.createSymbol(type: type)?.image
        symbolLabel.text = factory.createSymbol(type: type)?.describe
    }
}
