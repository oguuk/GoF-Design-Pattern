//
//  CustomerProtocol.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import Foundation

protocol CustomerProtocol {
    func accept(visitor: Visitor) -> String
}
