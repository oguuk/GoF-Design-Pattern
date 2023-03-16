//
//  CompositeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/16.
//

import UIKit

class CompositeViewController: UIViewController {
    
    private var square1 = Square()
    private var square2 = Square()
    private var square3 = Square()
    private var square4 = Square()
    private var square5 = Square()
    private var square6 = Square()
    
    private var domino0 = Domino()
    private var domino1 = Domino()
    private var domino2 = Domino()
    private var domino3 = Domino()
    private var domino4 = Domino()
    private var domino5 = Domino()
    private var domino6 = Domino()
    
    @IBOutlet weak var die1: UIImageView!
    @IBOutlet weak var die2: UIImageView!
    @IBOutlet weak var die3: UIImageView!
    @IBOutlet weak var die4: UIImageView!
    @IBOutlet weak var die5: UIImageView!
    @IBOutlet weak var die6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        domino1.addSquare(domino: square1)
        domino2.addSquare(domino: square2)
        domino3.addSquare(domino: square3)
        domino4.addSquare(domino: square4)
        domino5.addSquare(domino: square5)
        domino6.addSquare(domino: square6)
        for domino in [domino1, domino2, domino3, domino4, domino5, domino6] {
            domino0.addSquare(domino: domino)
        }
    }
    
    @IBAction func startButtonDidTap(_ sender: Any) {
        var datas = [die6, die5, die4, die3, die2, die1]
        domino0.start(&datas)
    }
}
