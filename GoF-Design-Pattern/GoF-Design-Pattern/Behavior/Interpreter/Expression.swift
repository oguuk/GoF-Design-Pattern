//
//  Expression.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

protocol Expression {
    func interpreter(_ context: IntergerContext) -> Int?
}
