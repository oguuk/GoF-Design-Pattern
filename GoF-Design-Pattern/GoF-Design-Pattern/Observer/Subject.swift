//
//  Subject.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import Foundation

class Observable<Event> {
    
    private var observers = [AnyObserver<Event>]()
    
    func addObserver<observer: ObserverProtocol>(observer: observer) where observer.Event == Event {
        observers.append(AnyObserver(observer))
    }
    
    func removeObserver<observer: ObserverProtocol>(observer: observer) where observer.Event == Event {
        observers.removeAll(where: { $0 === observer })
    }
    
    func notifyObservers(event: Event?) {

        for observer in observers {
            observer.update(event: event)
        }
    }
}
