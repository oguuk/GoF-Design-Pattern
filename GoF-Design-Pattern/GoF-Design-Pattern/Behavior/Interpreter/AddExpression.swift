//
//  AddExpression.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

struct AddExpression: Expression {
    
    private let left: Expression
    private let right: Expression
    
    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }
    
    func interpreter(_ context: IntergerContext) -> Int? {
        guard let left = left.interpreter(context) else { return nil }
        guard let right = right.interpreter(context) else  { return nil }
        return left  + right
    }
}
