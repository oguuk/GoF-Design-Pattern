//
//  Strategy.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

protocol AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int?
}
