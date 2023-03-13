//
//  ObserverViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

class ObserverViewController: UIViewController {
    
    let images = Observable<UIImage>()
    let texts = Observable<String>()
    let factory = SymbolFactory()
    
    @IBOutlet weak var symbolImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images.addObserver(observer: symbolImageView)
        texts.addObserver(observer: symbolLabel)
    }
    
    @IBAction func createButtonDidTap(_ sender: Any) {
        let type = SymbolType.allCases.randomElement()!
        images.notifyObservers(event: factory.createSymbol(type: type)?.image)
        texts.notifyObservers(event: factory.createSymbol(type: type)?.describe)
    }
    

}
