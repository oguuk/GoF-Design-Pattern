//
//  MediatorViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

class MediatorViewController: UIViewController {
    
    private var mediator: Mediator = Mediator()
    private var colleague1: ColleagueProtocol = Colleague()
    private var colleague2: ColleagueProtocol = Colleague()
    private var colleague3: ColleagueProtocol = Colleague()
    private let c1Subject = Observable<String>()
    private let c2Subject = Observable<String>()
    private let c3Subject = Observable<String>()

    @IBOutlet weak var stack4Label: UILabel! // 오른쪽
    @IBOutlet weak var stack5Label: UILabel! // 중앙
    @IBOutlet weak var stack6Label: UILabel! // 왼쪽
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
    }
    
    private func configure() {
        mediator.addColleague(colleague: &colleague1)
        mediator.addColleague(colleague: &colleague2)
        mediator.addColleague(colleague: &colleague3)
        colleague1.mediator = mediator
        colleague2.mediator = mediator
        colleague3.mediator = mediator
    }
    
    private func bind() {
        c1Subject.addObserver(observer: stack4Label)
        c2Subject.addObserver(observer: stack5Label)
        c3Subject.addObserver(observer: stack6Label)

    }
    
    @IBAction func stack4ButtonDidTap(_ sender: Any) {
        colleague1.send(message: "야")
        c1Subject.notifyObservers(event: "야")
        c2Subject.notifyObservers(event: colleague2.receive)
        c3Subject.notifyObservers(event: colleague3.receive)
    }
    
    @IBAction func stack5ButtonDidTap(_ sender: Any) {
        colleague2.send(message: "야")
        c1Subject.notifyObservers(event: colleague1.receive)
        c2Subject.notifyObservers(event: "야")
        c3Subject.notifyObservers(event: colleague3.receive)
    }
    
    @IBAction func stack6ButtonDidTap(_ sender: Any) {
        colleague3.send(message: "야")
        c1Subject.notifyObservers(event: colleague1.receive)
        c2Subject.notifyObservers(event: colleague2.receive)
        c3Subject.notifyObservers(event: "야")
    }
}
