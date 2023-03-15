//
//  Customer.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

struct Child: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}

struct Adult: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}

struct Elderly: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}
