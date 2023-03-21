//
//  BridgeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

class BridgeViewController: UIViewController {
    
    var pen: Pen? = nil
    @IBOutlet weak var penLabel: UILabel!
    @IBOutlet weak var paperTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        pen?.write(text: sender.text ?? "", view: paperTextView)
    }
    
    @IBAction func zebraButtonDidTap(_ sender: Any) {
        penLabel.text = "pen : zebra"
        let random = CGFloat((1...20).randomElement()!)
        let ink = Color(bold: .systemFont(ofSize: random), color: .red)
        pen = Zebra(ink: ink)
    }
    
    @IBAction func hiTecCButtonDidTap(_ sender: Any) {
        penLabel.text = "pen : Hi-Tec-C"
        let random = CGFloat((1...20).randomElement()!)
        let ink = Color(bold: .systemFont(ofSize: random), color: .blue)
        pen = HiTecC(ink: ink)
    }
}
