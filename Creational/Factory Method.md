# Factory Method
    Factory Method 패턴은 객체 생성을 위한 디자인 패턴으로, 객체를 생성하는 인터페이스를 정의하고, 이를 서브 클래스에서 구현하도록 하는 방식으로 동작한다.
    이 패턴은 객체 생성을 중심으로 하는 애플리케이션에서 유용하게 사용된다. 
    예를 들어, 게임에서 아이템을 생성하는데, 각 아이템의 생성 방법이 다른 경우에 이 패턴을 사용할 수 있다. 
    또한, 객체를 생성하는 방식이 변경되어야 하는 경우도 유연하게 대처할 수 있다.

## Example
```swift
import UIKit

protocol Symbol {
    var image: UIImage? { get }
    var describe: String { get }
}

enum SymbolType: CaseIterable {
    case heart
    case brokeHeart
}

final class Heart: Symbol {
    
    var image: UIImage? {
        return UIImage(systemName: "heart.fill")
    }
    
    var describe: String {
        return "this is heartSymbol."
    }
}

final class BrokeHeart: Symbol {
    
    var image: UIImage? {
        return UIImage(systemName: "heart.slash.fill")
    }
    
    var describe: String {
        return "this is brokeHeartSymbol."
    }
}

struct SymbolFactory {
    
    func createSymbol(type: SymbolType) -> Symbol? {
        switch type {
        case .heart:
            return Heart()
        case .brokeHeart:
            return BrokeHeart()
        }
    }
}
```

## Usage
```swift
    let factory = SymbolFactory()    
    
    let image = factory.createSymbol(type: .heart).image
    let describe = factory.createSymbol(type: .heart).describe
```
