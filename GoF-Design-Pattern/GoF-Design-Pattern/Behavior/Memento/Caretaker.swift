//
//  Caretaker.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

struct Caretaker<T> {
    
    var mementos: [Memento<T>] = []
    
    mutating func addMemento(_ memento: Memento<T>) {
        mementos.append(memento)
    }
    
    func getMemento(at index: Int) -> Memento<T>? {
        if index >= mementos.endIndex || index < 0 { return nil }
        return mementos[index]
    }
}
