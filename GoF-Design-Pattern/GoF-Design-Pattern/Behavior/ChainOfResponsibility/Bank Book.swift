//
//  Bank Book.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class BankBook {
    
    private var balance: Int
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func deposit(amout: Int) {
        balance += amout
    }
    
    func withdraw(amount: Int) -> Bool {
        if balance < amount { return false }
        balance -= amount
        return true
    }
    
    func currentBalance() -> Int {
        return balance
    }
}
