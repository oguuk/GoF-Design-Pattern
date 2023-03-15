//
//  MementoViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

class MementoViewController: UIViewController {
    
    private var caretaker = Caretaker<String>()
    private var originator = Originator<String>()
    private let originatorSubject = Observable<String>()
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var indexTextField: UITextField!
    @IBOutlet weak var currentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        originatorSubject.addObserver(observer: currentLabel)
    }
    
    @IBAction func addButtonDidTap(_ sender: Any) {
        guard let text = addTextField.text else { return }
        originator.setContent(content: text)
        caretaker.addMemento(originator.createMemento()!)
    }
    
    @IBAction func changeButtonDidTap(_ sender: Any) {
        guard let text = indexTextField.text, let index = Int(text) else { return }
        guard let memento = caretaker.getMemento(at: index - 1) else {
            currentLabel.text = "잘못된 index"
            return
        }
        originator.restore(from: memento)
        originatorSubject.notifyObservers(event: originator.showContent())
    }
}
