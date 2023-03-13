//
//  Observer.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import Foundation

protocol ObserverProtocol: AnyObject {
    associatedtype Event
    func update(event: Event?)
}

final class AnyObserver<Event>: ObserverProtocol {
    private let update: (Event?) -> Void
    
    init<observer: ObserverProtocol>(_ observer: observer) where observer.Event == Event {
        self.update = observer.update
    }
    
    func update(event: Event?) {
        self.update(event)
    }
}
