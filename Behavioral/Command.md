# Command
    Command 패턴은 실행될 기능을 캡슐화하여 객체로 표현하는 패턴으로, 요청을 하는 객체와 요청을 수행하는 객체를 분리할 수 있다.
    
    Command 패턴은 다음과 같은 객체로 이루어진다.
    
    Command: 실행될 기능을 캡슐화한 인터페이스
    ConcreteCommand: Command 인터페이스를 구현한 구체적인 클래스
    Invoker: Command 객체를 실행하는 역할을 하는 클래스
    Receiver: ConcreteCommand 객체가 요청을 처리하는 객체

## Example
```swift
import UIKit

protocol Command {
    func execute()
    func undo()
}

struct LightOnCommand: Command { // ConcreteCommand
    
    private let lighter: Lighter
    
    init(lighter: Lighter) {
        self.lighter = lighter
    }
    
    func execute() {
        lighter.light = .On
    }
    
    func undo() {
        lighter.light = .Off
    }
}

struct LightOffCommand: Command { // ConcreteCommand
    
    private let lighter: Lighter
    
    init(lighter: Lighter) {
        self.lighter = lighter
    }
    
    func execute() {
        lighter.light = .Off
    }
    
    func undo() {
        lighter.light = .On
    }
}

class Lighter { // Receiver
    var light: Light = .Off
}

enum Light: String {
    case On = "lightbulb.fill"
    case Off = "lightbulb"
}

class Invoker { // Invoker
    
    var command: Command?
    
    func commandExecute() {
        command?.execute()
    }
    
    func commandUndo() {
        command?.undo()
    }
}

```

## Usage
```swift
let lighter = Lighter()
let invoker = Invoker()
var lightOn = LightOnCommand(lighter: lighter)
var lighOff = LightOffCommand(lighter: lighter)

invoker.command = lightOn
invoker.commandExecute() // lighter의 light가 On
```
