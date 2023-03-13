//
//  AgeCalculator.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

struct AgeCalculator {
    
    private let strategy: AgeStrategy
    
    init(strategy: AgeStrategy) {
        self.strategy = strategy
    }
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let age = strategy.birth(year: year, month: month, day: day) ?? -1
        return age < 0 ? nil : age
    }
}
