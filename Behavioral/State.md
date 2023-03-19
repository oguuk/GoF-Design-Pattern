# State
    State 패턴은 객체의 상태에 따라 행위를 변경하는 패턴으로 객체의 상태 변화에 따른 행위를 간단하게 구현할 수 있으며, 코드의 가독성과 유지보수성을 높일 수 있다.
    
    State 패턴은 다음과 같은 객체로 이루어진다.

    Context: State 객체를 가지고 있는 클래스로 Context 객체는 State 객체를 변경하고, 상태에 따른 행위를 수행.
    State: Context 객체의 상태를 나타내는 인터페이스로 State 객체는 Context 객체의 상태에 따른 행위를 수행.
    ConcreteState: State 인터페이스를 구현한 구체적인 클래스로 ConcreteState 객체는 Context 객체의 상태에 따른 행위를 구체적으로 구현.

## Example
```swift
import UIKit

protocol ScreenTapState {
    var tapTimes: Int { get set }
    var colors: [UIColor] { get set }
    mutating func backgroundColor() -> UIColor
}

struct ScreenColorState: ScreenTapState {
    
    var tapTimes: Int = 0
    var colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemBlue, .purple]
    
    mutating func backgroundColor() -> UIColor {
        tapTimes %= colors.count
        defer { tapTimes += 1 }
        return colors [tapTimes]
    }
}
```

## Usage
```swift
var state: ScreenTapState = ScreenColorState()

@IBAction func tapGestureNotify(_ sender: UITapGestureRecognizer) {
    view.backgroundColor = state.backgroundColor()
}
```
