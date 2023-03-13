//
//  Prototype.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/10.
//

import Foundation

protocol Prototype {
    associatedtype T
    func clone() -> T
}
