# Bridge
    Bridge 패턴은 추상화와 구현을 분리하여 두 개의 계층을 연결하는 패턴이다. 
    이렇게 분리된 두 계층은 다양한 방식으로 조합될 수 있으며, 이를 통해 새로운 기능을 쉽게 추가할 수 있어 유연성과 확장성이 좋다.

## Example
```swift
import UIKit

protocol Ink {
    var bold: UIFont { get set }
    var color: UIColor { get set }
    
    func apply(view: UIView)
}

protocol Pen {
    func write(text: String, view: UIView)
}

struct Color: Ink {
    
    var bold: UIFont
    var color: UIColor
    
    func apply(view: UIView) {
        if let textField = view as? UITextView {
            textField.font = bold
            textField.textColor = color
        } else if let label = view as? UILabel {
            label.font = bold
            label.textColor = color
        }
    }
}

struct HiTecC: Pen {
    
    private(set) var ink: Ink
    
    init(ink: Ink) { self.ink = ink }
    
    func write(text: String, view: UIView) {
        if let textField = view as? UITextView { textField.text = text }
        else if let label = view as? UILabel { label.text = text }
        ink.apply(view: view)
    }
}

struct Zebra: Pen {
    
    private(set) var ink: Ink
    
    init(ink: Ink) { self.ink = ink }
    
    func write(text: String, view: UIView) {
        if let textField = view as? UITextView { textField.text = text }
        else if let label = view as? UILabel { label.text = text }
        ink.apply(view: view)
    }
}
```

## Usage
```swift
@IBOutlet weak var zebraPaperTextView: UITextView!
@IBOutlet weak var hiTecCPaperTextView: UITextView!

let random = CGFloat((1...20).randomElement()!)
let zInk = Color(bold: .systemFont(ofSize: random), color: .red)
let hInk = Color(bold: .systemFont(ofSize: random), color: .red)

let zebra = Zebra(ink: ink)
let hiTecC = HiTecC(ink: ink)

zebra.write(text: "안녕하세요. zebra 입니다.", view: zebraPaperTextView)
hiTecC.write(text: "안녕하세요. hiTecC 입니다.", view: hiTecCPaperTextView)
```
