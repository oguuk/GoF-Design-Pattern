//
//  Colleague.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

protocol ColleagueProtocol: AnyObject {
    var mediator: Mediator? { get set }
    var receive: String? { get set }
    func send(message: String)
}

final class Colleague: ColleagueProtocol {
    
    var mediator: Mediator?
    var receive: String?
    
    func send(message: String) {
        mediator?.send(message: "왜?", sender: self)
    }
}
