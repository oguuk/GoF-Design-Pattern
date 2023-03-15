//
//  IntergerContext.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

final class IntergerContext {
    
    private var variables: [String: Int] = [:]
    
    func getValue(for key: VariableExpression) -> Int? {
        return variables[key.name]
    }
    
    func setValue(_ value: Int, for key: VariableExpression) {
        variables[key.name] = value
    }
}
