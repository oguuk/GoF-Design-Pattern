# Singleton
    싱글톤 패턴은 객체의 인스턴스가 한 번만 생성되는 패턴이다.
    싱글톤 패턴을 사용하면, 전역 변수를 사용하지 않고도 인스턴스가 하나만 존재하도록 할 수 있다. 
    이를 통해 객체 지향 프로그래밍의 원칙 중 하나인 캡슐화를 보다 잘 지킬 수 있다.

## Example
```swift
import UIKit

final class LoginSingleton {
    
    static let shared = LoginSingleton()
    
    private var login = false
    private var userName: String? = "GoF"
    private var password: String? = "1234"
    
    private init() {}
    
    func login(withUserName userName: String, password: String) { // 로그인 처리
        if self.userName == userName && self.password == password {
            self.isLoggedIn = true
        } else {
            self.isLoggedIn = false
        }
    }
    
    func logout() { // 로그아웃 처리
        self.isLoggedIn = false
        self.userName = nil
        self.password = nil
    }
    
    func isLoggedIn() -> Bool {
        return login
    }
}
```

## Usage
```swift
    @IBOutlet weak var IDTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    LoginSingleton.shared.login(withUserName: IDTextField.text ?? "", password: passwordTextField.text ?? "")
    
    if LoginSingleton.shared.isLoggedIn() {
        // 로그인 된 상황
    } else {
        // 로그인 되지 않은 상황
    }
    
```
