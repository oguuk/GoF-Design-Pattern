//
//  Visitor.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

protocol Visitor {
    func visit(who: Child) -> String
    func visit(who: Adult) -> String
    func visit(who: Elderly) -> String
}
