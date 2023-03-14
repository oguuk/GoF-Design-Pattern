//
//  TemplateViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import UIKit

class TemplateViewController: BaseViewController {
    
    @IBOutlet weak var templateLabel: UILabel!
    
    override func layout() {
        templateLabel.text = "This is Template Method.\n TemplateVC inherits from BaseVC."
    }
}
