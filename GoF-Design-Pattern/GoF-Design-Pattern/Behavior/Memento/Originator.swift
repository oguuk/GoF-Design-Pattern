//
//  Originator.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

struct Originator<T> {
     
    private var content: T?
    
    func createMemento() -> Memento<T>? {
        return Memento(content: content)
    }
    
    func showContent() -> T? {
        return content
    }
    
    mutating func setContent(content: T) {
        self.content = content
    }
    
    mutating func restore(from memento: Memento<T>) {
        content = memento.content
    }
}
