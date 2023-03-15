//
//  VariableExpression.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation


struct VariableExpression: Expression {
    
    let name: String
    
    func interpreter(_ context: IntergerContext) -> Int? {
        return context.getValue(for: self)
    }
}
