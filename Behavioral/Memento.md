# Memento
    Memento 패턴은 객체의 상태를 저장하고 이전 상태로 복원하는데 사용하는 패턴으로 객체의 상태를 캡슐화하고 저장할 수 있으며, 필요한 경우 이전 상태로 복원할 수 있다.
    
    Memento 패턴은 다음과 같은 객체로 이루어진다.

    Originator: Memento 객체를 생성하고 현재 상태를 저장하는 클래스.
    Memento: Originator 객체의 상태를 저장하는 클래스.
    Caretaker: Memento 객체를 관리하는 클래스. Memento 객체를 저장하고 복원.

## Example
```swift
import UIKit
struct Originator<T> {
     
    private var content: T?
    
    func createMemento() -> Memento<T>? {
        return Memento(content: content)
    }
    
    func showContent() -> T? {
        return content
    }
    
    mutating func setContent(content: T) {
        self.content = content
    }
    
    mutating func restore(from memento: Memento<T>) {
        content = memento.content
    }
}

struct Memento<T> {
    
    var content: T?
}

struct Caretaker<T> {
    
    var mementos: [Memento<T>] = []
    
    mutating func addMemento(_ memento: Memento<T>) {
        mementos.append(memento)
    }
    
    func getMemento(at index: Int) -> Memento<T>? {
        if index >= mementos.endIndex || index < 0 { return nil }
        return mementos[index]
    }
}
```

## Usage
```swift
var caretaker = Caretaker<String>()
var originator = Originator<String>()

// memento 저장

let text = readLine()!
originator.setContent(content: text)
caretaker.addMemento(originator.createMemento()!)

// originator 갱신
let index = Int(readLine()!)!
let memento = caretaker.getMemento(at: index - 1)
originator.restore(from: memento)
```
