//
//  Mediator.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

protocol MediatorProtocol {
    func send(message: String, sender: ColleagueProtocol)
}

struct Mediator: MediatorProtocol {
    
    private var colleagues: [ColleagueProtocol] = []
    
    mutating func addColleague(colleague: inout ColleagueProtocol) {
        colleague.mediator = self
        colleagues.append(colleague)
    }
    
    func send(message: String, sender: ColleagueProtocol) {
        colleagues.forEach { colleague in
            if colleague === sender { return }
            colleague.receive = message
        }
    }
}
