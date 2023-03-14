//
//  ChainOfResponsibilityViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import UIKit

class ChainOfResponsibilityViewController: UIViewController {
    
    var deposit: DepositHandler = DepositHandler()
    var withdraw: WithdrawHandler = WithdrawHandler()
    let myBook = BankBook(balance: 10000)
    let otherBook = BankBook(balance: 10000)
    let myBookSubject = Observable<String>()
    let otherBookSubject = Observable<String>()
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var myBankBookBalance: UILabel!
    @IBOutlet weak var otherBankBookBalance: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        deposit.nextHandler = withdraw
        withdraw.nextHandler = deposit
        myBookSubject.addObserver(observer: myBankBookBalance)
        otherBookSubject.addObserver(observer: otherBankBookBalance)
    }
    
    @IBAction func depositButtonDidTap(_ sender: Any) {
        guard let text = amountTextField.text, let amount = Int(text) else { return }
        let result = deposit.handle(amount: amount, bankBook: myBook)
        
        if result != nil { resultLabel.text = "입금을 성공하였습니다."}
        else { resultLabel.text = "입금을 실패하였습니다." }
        myBookSubject.notifyObservers(event: "\(myBook.currentBalance())")
    }
    
    @IBAction func withdrawButtonDidTap(_ sender: Any) {
        guard let text = amountTextField.text, let amount = Int(text) else { return }
        let result = withdraw.handle(amount: amount, bankBook: myBook)
        
        if result != nil { resultLabel.text = "출금을 성공하였습니다."}
        else { resultLabel.text = "출금을 실패하였습니다." }
        myBookSubject.notifyObservers(event: "\(myBook.currentBalance())")
    }
    
    @IBAction func sendButtonDidTap(_ sender: Any) {
        guard let text = amountTextField.text, let amount = Int(text) else { return }
        let result = withdraw.handle(amount: amount, bankBook: myBook)?
            .handle(amount: amount, bankBook: otherBook)
        
        if result != nil { resultLabel.text = "송금을 성공하였습니다."}
        else { resultLabel.text = "송금을 실패하였습니다." }
        myBookSubject.notifyObservers(event: "\(myBook.currentBalance())")
        otherBookSubject.notifyObservers(event: "\(otherBook.currentBalance())")
    }
}
