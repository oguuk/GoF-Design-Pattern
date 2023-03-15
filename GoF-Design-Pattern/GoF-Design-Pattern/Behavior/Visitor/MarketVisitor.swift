//
//  MarketVisitor.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

class MarketVisitor: Visitor {
    
    func visit(who: Child) -> String {
        return "유아 손님 방문"
    }
    
    func visit(who: Adult) -> String {
        return "성인 손님 방문"
    }
    
    func visit(who: Elderly) -> String {
        return "노약자 손님 방문"
    }
}
