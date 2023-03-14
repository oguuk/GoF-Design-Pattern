//
//  CommandViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import UIKit

class CommandViewController: UIViewController {
    
    private let lighter = Lighter()
    private let invoker = Invoker()
    private var lightOn: LightOnCommand? = nil
    private var lighOff: LightOffCommand? = nil
    private let lightSubject = Observable<UIImage>()
    @IBOutlet weak var bulbImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        lighOff = LightOffCommand(lighter: lighter)
        lightOn = LightOnCommand(lighter: lighter)
        lightSubject.addObserver(observer: bulbImageView)
    }
    
    @IBAction func onButtonDidTap(_ sender: Any) {
        invoker.command = lightOn
        invoker.commandExecute()
        lightSubject.notifyObservers(event: UIImage(systemName: lighter.light.rawValue))
    }
    
    @IBAction func offButtonDidTap(_ sender: Any) {
        invoker.command = lighOff
        invoker.commandExecute()
        lightSubject.notifyObservers(event: UIImage(systemName: lighter.light.rawValue))
    }
}
