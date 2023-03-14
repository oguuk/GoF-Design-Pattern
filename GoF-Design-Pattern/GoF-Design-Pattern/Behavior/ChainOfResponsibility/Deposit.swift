//
//  Deposit.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class DepositHandler: Transaction { // 입금
    
   var nextHandler: Transaction? = nil
    
    func handle(amount: Int, bankBook: BankBook?) -> Transaction? {
        bankBook?.deposit(amout: amount)
        return nextHandler
    }
}
