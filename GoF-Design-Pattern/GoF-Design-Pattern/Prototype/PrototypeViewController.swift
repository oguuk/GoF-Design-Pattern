//
//  PrototypeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/10.
//

import UIKit

class PrototypeViewController: UIViewController {
    
    let prototype = Building()
    @IBOutlet weak var cloneBoard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cloneButtonDidTap(_ sender: Any) {
        let building = prototype.clone()
        let randomX = CGFloat(arc4random_uniform(UInt32(cloneBoard.bounds.width)))
        let randomY = CGFloat(arc4random_uniform(UInt32(cloneBoard.bounds.height)))
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1.0)
        building.image.center = CGPoint(x: randomX, y: randomY)
        building.image.tintColor = randomColor
        cloneBoard.addSubview(building.image)
        
    }
}
