//
//  BridgeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

class BridgeViewController: UIViewController {
    
    var pen: Pen = Zebra(boldSize: 13, color: .red)
    @IBOutlet weak var penLabel: UILabel!
    @IBOutlet weak var paperTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        paperTextView.text = sender.text
        paperTextView.textColor = pen.color
        paperTextView.font = pen.bold
    }
    
    @IBAction func zebraButtonDidTap(_ sender: Any) {
        penLabel.text = "pen : zebra"
        let random = CGFloat((1...20).randomElement()!)
        pen = Zebra(boldSize: random, color: .red)
    }
    
    @IBAction func hiTecCButtonDidTap(_ sender: Any) {
        penLabel.text = "pen : Hi-Tec-C"
        let random = CGFloat((1...20).randomElement()!)
        pen = HiTecC(boldSize: random, color: UIColor.tintColor)
    }
}
