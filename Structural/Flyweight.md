# Flyweight
    Flyweight 패턴은 객체 생성 비용을 줄이기 위해 객체를 공유하는 패턴이다.
    객체 생성은 많은 자원과 시간을 소모하므로, 이 패턴은 객체 생성 비용을 줄이기 위해 객체를 공유하여 재사용한다. 
    객체 생성에 드는 비용이 높은 경우, 메모리 사용량이 많은 경우, 객체의 상태가 변하지 않는 경우 등에 유용하다.

## Example
```swift
import Foundation

final class FlyweightClass {
    
    var address: UnsafeMutableRawPointer?
    
    init() {
        self.address = Unmanaged.passUnretained(self).toOpaque()
    }
}

struct FlyweightFactory {
    
    private var weights: [String: FlyweightClass] = [:]
    
    mutating func getWeights(name: String) -> FlyweightClass {
        if weights[name] == nil {
            weights[name] = FlyweightClass()
        }
        
        return weights[name]!
    }
}
```

## Usage
```swift
var factory: FlyweightFactory = FlyweightFactory()

let weightObject = factory.getWeights(name: readLine())
guard let address = weightObject.address else { return } // address를 확인하면 주속값이 같음
```
