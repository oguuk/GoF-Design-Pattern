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
        templateLabel.text = "이 패턴은 모든 ViewController의 BaseViewController로 적용됨."
    }
}
