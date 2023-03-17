## 두 개의 계층을 연결했다고 보기 어려운듯 리팩토링 필요
# Bridge
    Bridge 패턴은 추상화와 구현을 분리하여 두 개의 계층을 연결하는 패턴이다. 
    이렇게 분리된 두 계층은 다양한 방식으로 조합될 수 있으며, 이를 통해 새로운 기능을 쉽게 추가할 수 있어 유연성과 확장성이 좋다.

## Example
```swift
import UIKit

protocol Ink { // 추상화 계층
    
    var bold: UIFont { get set }
    var color: UIColor { get set }
}

protocol Pen: Ink { // 추상화 계층
    
    func write(str: String) -> UILabel
}

struct HiTecC: Pen { // 구현 계층
    
    var bold: UIFont
    var color: UIColor
    
    init(boldSize: CGFloat, color: UIColor) {
        self.bold = UIFont.boldSystemFont(ofSize: boldSize)
        self.color = color
    }
    
    func write(str: String) -> UILabel {
        let label = UILabel()
        return label
    }
}

struct Zebra: Pen { // 구현 계층
    
    var bold: UIFont
    var color: UIColor
    
    init(boldSize: CGFloat, color: UIColor) {
        self.bold = UIFont.boldSystemFont(ofSize: boldSize)
        self.color = color
    }
    
    func write(str: String) -> UILabel {
        let label = UILabel()
        return label
    }
}


```

## Usage
```swift
    var zebra: Pen = Zebra(boldSize: 13, color: .red)
    var hiTecC: Pen = HiTecC(boldSize: 13, color: .blue)
```
