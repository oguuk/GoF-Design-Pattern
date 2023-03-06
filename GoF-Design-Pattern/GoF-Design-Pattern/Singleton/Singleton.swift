//
//  Singleton.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import Foundation
import UIKit

final class LoginSingleton {
    
    static let shared = LoginSingleton()
    
    var isLoggedIn = false
    var userName: String? = "GoF"
    var password: String? = "1234"
    
    private init() {}
    
    func login(withUserName userName: String, password: String) {
        // 로그인 처리
        if self.userName == userName && self.password == password {
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
        }
    }
    
    func logout() {
        // 로그아웃 처리
        self.isLoggedIn = false
        self.userName = nil
        self.password = nil
    }
}
