# Mediator
    Mediator 패턴은 객체 간의 상호작용을 캡슐화하여 객체 사이의 결합도를 낮추는 패턴으로 객체 간의 직접적인 통신이 아닌, 중개자 객체를 통해 간접적으로 통신할 수 있다.
    
    Mediator 패턴은 다음과 같은 객체로 이루어집니다.

    Mediator: 객체 간의 통신을 캡슐화하는 인터페이스
    ConcreteMediator: Mediator 인터페이스를 구현한 구체적인 클래스. 객체 간의 통신을 관리하고 조정
    Colleague: Mediator 객체와 상호작용하는 객체를 나타내는 추상 클래스.
    ConcreteColleague: Colleague 추상 클래스를 구현한 구체적인 클래스. Mediator 객체와 상호작용하며, 다른 Colleague 객체와도 상호작용.

## Example
```swift
import UIKit

protocol MediatorProtocol {
    func send(message: String, sender: ColleagueProtocol)
}

struct Mediator: MediatorProtocol {
    
    private var colleagues: [ColleagueProtocol] = []
    
    mutating func addColleague(colleague: inout ColleagueProtocol) {
        colleague.mediator = self
        colleagues.append(colleague)
    }
    
    func send(message: String, sender: ColleagueProtocol) {
        colleagues.forEach { colleague in
            if colleague === sender { return }
            colleague.receive = message
        }
    }
}

protocol ColleagueProtocol: AnyObject {
    var mediator: Mediator? { get set }
    var receive: String? { get set }
    func send(message: String)
}

final class Colleague: ColleagueProtocol {
    
    var mediator: Mediator?
    var receive: String?
    
    func send(message: String) {
        mediator?.send(message: message, sender: self)
    }
}
```

## Usage
```swift
var mediator: Mediator = Mediator()
var colleague1: ColleagueProtocol = Colleague()
var colleague2: ColleagueProtocol = Colleague()
var colleague3: ColleagueProtocol = Colleague()

mediator.addColleague(colleague: &colleague1)
mediator.addColleague(colleague: &colleague2)
mediator.addColleague(colleague: &colleague3)
colleague1.mediator = mediator
colleague2.mediator = mediator
colleague3.mediator = mediator

let message = readLine()!

colleague1.send(message: message)
colleague2.send(message: message)
colleague3.send(message: message)
```
