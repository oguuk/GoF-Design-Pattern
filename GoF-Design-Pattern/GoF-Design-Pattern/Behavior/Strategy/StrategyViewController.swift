//
//  StrategyViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import UIKit

class StrategyViewController: UIViewController {
    
    let koreaAgeCalculator = AgeCalculator(strategy: KoreanAge())
    let internationalAgeCalculator = AgeCalculator(strategy: InternationalAge())
    
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var internationalAge: UILabel!
    @IBOutlet weak var koreaAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func aaa(_ sender: UITextField) {
        guard let text = sender.text else { return }
        let input = text.split(separator: "-").compactMap { Int(String($0)) }
        if input.count < 3 { return }
        let international = internationalAgeCalculator.birth(year: input[0], month: input[1], day: input[2]) ?? -1
        let korea = koreaAgeCalculator.birth(year: input[0], month: input[1], day: input[2]) ?? -1
        internationalAge.text = international == -1 ? "-" : "\(international)"
        koreaAge.text = korea == -1 ? "-" : "\(korea)"
    }
    
    
}
