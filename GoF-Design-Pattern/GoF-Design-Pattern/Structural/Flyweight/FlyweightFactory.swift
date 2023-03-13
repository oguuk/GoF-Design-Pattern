//
//  FlyweightFactory.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import Foundation

struct FlyweightFactory {
    
    private var weights: [String: FlyweightClass] = [:]
    
    mutating func getWeights(name: String) -> FlyweightClass {
        if weights[name] == nil {
            weights[name] = FlyweightClass()
        }
        
        return weights[name]!
    }
}
