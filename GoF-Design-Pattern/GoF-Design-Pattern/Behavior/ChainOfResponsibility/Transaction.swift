//
//  Transaction.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

protocol Transaction {
    var nextHandler: Transaction? { get set }
    func handle(amount: Int, bankBook: BankBook?) -> Transaction?
}
