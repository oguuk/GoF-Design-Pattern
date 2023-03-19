# Visitor
    Visitor 패턴은 객체 구조를 수정하지 않고도 새로운 작업을 수행할 수 있게 하는 방법을 제공한다.
    Visitor 객체는 객체 구조를 순회하고 각 객체를 방문하여 새로운 작업을 수행한다. 
    Visitor 객체는 각 객체의 클래스를 알고 있어야 하며, 객체 클래스에 새로운 메소드를 추가하지 않아도 된다.
    
## Example
```swift
import UIKit

protocol Visitor {
    func visit(who: Child) -> String
    func visit(who: Adult) -> String
    func visit(who: Elderly) -> String
}

protocol CustomerProtocol {
    func accept(visitor: Visitor) -> String
}

struct Child: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}

struct Adult: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}

struct Elderly: CustomerProtocol {
    
    func accept(visitor: Visitor) -> String {
        return visitor.visit(who: self)
    }
}

class MarketVisitor: Visitor {
    
    func visit(who: Child) -> String {
        return "유아 손님 방문"
    }
    
    func visit(who: Adult) -> String {
        return "성인 손님 방문"
    }
    
    func visit(who: Elderly) -> String {
        return "노약자 손님 방문"
    }
}
```

## Usage
```swift
let visitor: Visitor = MarketVisitor()

let child = Child()
print(child.accept(visitor: visitor)) // "유아 손님 방문"

let adult = Adult()
print(adult.accept(visitor: visitor)) // "성인 손님 방문"

let elderly = Elderly()
print(elderly.accept(visitor: visitor)) // "노약자 손님 방문"
```
