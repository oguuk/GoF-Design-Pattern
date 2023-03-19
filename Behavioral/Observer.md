# Observer
    Observer 패턴은 객체의 상태 변화를 감시하고, 이에 대한 처리를 다른 객체에게 위임하는 패턴이다.
    객체 간의 의존성을 줄일 수 있으며, 유연하고 확장 가능한 코드를 작성할 수 있다.
    
    Observer 패턴은 다음과 같은 객체로 이루어진다.

    Subject: Observer 객체들을 등록하고, 등록된 Observer 객체들에게 상태 변화를 알리는 클래스.
    Observer: Subject 객체의 상태 변화를 감시하고, 상태 변화에 따른 처리를 수행하는 인터페이스.
    ConcreteSubject: Subject 클래스를 구현한 구체적인 클래스로 상태 변화를 발생시키고, Observer 객체들에게 상태 변화를 알림.
    ConcreteObserver: Observer 클래스를 구현한 구체적인 클래스로 Subject 객체의 상태 변화를 감시하고, 상태 변화에 따른 처리를 수행함.

## Example
```swift
import UIKit

class Observable<Event> {
    
    private var observers = [AnyObserver<Event>]()
    
    func addObserver<observer: ObserverProtocol>(observer: observer) where observer.Event == Event {
        observers.append(AnyObserver(observer))
    }
    
    func removeObserver<observer: ObserverProtocol>(observer: observer) where observer.Event == Event {
        observers.removeAll(where: { $0 === observer })
    }
    
    func notifyObservers(event: Event?) {

        for observer in observers {
            observer.update(event: event)
        }
    }
}

protocol ObserverProtocol: AnyObject {
    associatedtype Event
    func update(event: Event?)
}

final class AnyObserver<Event>: ObserverProtocol {
    private let update: (Event?) -> Void
    
    init<observer: ObserverProtocol>(_ observer: observer) where observer.Event == Event {
        self.update = observer.update
    }
    
    func update(event: Event?) {
        self.update(event)
    }
}

extension UIImageView: ObserverProtocol {
    typealias Event = UIImage
    
    func update(event: Event?) {
        self.image = event
    }
}

extension UILabel: ObserverProtocol {
    typealias Event = String
    
    func update(event: Event?) {
        self.text = event
    }
}
```

## Usage
```swift
class ObserverViewController: UIViewController {
    
    let images = Observable<UIImage>()
    let texts = Observable<String>()
    let factory = SymbolFactory()
    
    @IBOutlet weak var symbolImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images.addObserver(observer: symbolImageView)
        texts.addObserver(observer: symbolLabel)
    }
    
    @IBAction func createButtonDidTap(_ sender: Any) {
        let type = SymbolType.allCases.randomElement()!
        images.notifyObservers(event: factory.createSymbol(type: type)?.image)
        texts.notifyObservers(event: factory.createSymbol(type: type)?.describe)
    }
}
```

