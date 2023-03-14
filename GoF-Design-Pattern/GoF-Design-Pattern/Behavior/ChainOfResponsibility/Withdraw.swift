//
//  Withdraw.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class WithdrawHandler: Transaction { // 출금
    
    var nextHandler: Transaction? = nil
    
    func handle(amount: Int, bankBook: BankBook?) -> Transaction? {
        return  bankBook?.withdraw(amount: amount) ?? false ? nextHandler : nil
    }
}
