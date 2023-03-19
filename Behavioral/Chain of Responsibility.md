# Chain of Responsibility
    Chain of Responsibility 패턴은 객체들이 연결된 체인 형태로 이루어져 있으며, 요청을 처리할 수 있는 객체를 찾을 때까지 체인 상의 객체들에게 요청을 전달하는 패턴이다.

## Example
```swift
import UIKit

protocol Transaction {
    var nextHandler: Transaction? { get set }
    func handle(amount: Int, bankBook: BankBook?) -> Transaction?
}

class DepositHandler: Transaction { // 입금
    
   var nextHandler: Transaction? = nil
    
    func handle(amount: Int, bankBook: BankBook?) -> Transaction? {
        bankBook?.deposit(amout: amount)
        return nextHandler
    }
}

class WithdrawHandler: Transaction { // 출금
    
    var nextHandler: Transaction? = nil
    
    func handle(amount: Int, bankBook: BankBook?) -> Transaction? {
        return  bankBook?.withdraw(amount: amount) ?? false ? nextHandler : nil
    }
}

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
```

## Usage
```swift
var deposit: DepositHandler = DepositHandler()
var withdraw: WithdrawHandler = WithdrawHandler()

let myBook = BankBook(balance: 10000)
let otherBook = BankBook(balance: 10000)    
deposit.nextHandler = withdraw
withdraw.nextHandler = deposit

let amount = Int(readLine()!)! // 송금 액수
let result = withdraw.handle(amount: amount, bankBook: myBook)? // 내 통장에서 빠져나가고
                     .handle(amount: amount, bankBook: otherBook) //  상대 통장에 돈이 들어간다. 

```
