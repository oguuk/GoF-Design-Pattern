# Prototype
    Prototype 패턴은 기존 객체를 복제해서 새로운 객체를 생성하는 방식으로 동작한다.
    먼저 원본 객체를 만들고, 이를 복제해서 새로운 객체를 생성된다.
      1. 얕은 복사(shallow copy)
      2. 깊은 복사(deep copy)
    Prototype 패턴은 객체 생성에 드는 비용이 많이 드는 경우에 유용하게 사용된다.

## Example
```swift
import UIKit

protocol Prototype {
    associatedtype T
    func clone() -> T
}

final class Building: Prototype {
    
    let name: String = "강남빌딩"
    let image = UIImageView.init(image: UIImage(systemName: "building.fill")!)
    var price: Int = 0
    
    func clone() -> Building {
        return Building()
    }
}

```

## Usage
```swift
    let prototype = Building()
    @IBOutlet weak var cloneBoard: UIView!
    
    @IBAction func cloneButtonDidTap(_ sender: Any) {
    let building = prototype.clone()
    let randomX = CGFloat(arc4random_uniform(UInt32(cloneBoard.bounds.width)))
    let randomY = CGFloat(arc4random_uniform(UInt32(cloneBoard.bounds.height)))
    let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                              green: CGFloat.random(in: 0...1),
                              blue: CGFloat.random(in: 0...1),
                              alpha: 1.0)
    building.image.center = CGPoint(x: randomX, y: randomY)
    building.image.tintColor = randomColor
    cloneBoard.addSubview(building.image)       
}
```
