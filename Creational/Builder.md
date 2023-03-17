# Builder
    Builder 패턴은 객체 생성을 위한 디자인 패턴으로, 복잡한 객체를 생성할 때 사용하며, 객체를 단계별로 생성하고 조립하는 방식으로 동작한다.
    Builder 패턴은 객체 생성 과정에서 발생할 수 있는 복잡성을 해결하고, 객체의 일관성과 안정성을 보장한다. 
    또한, 빌더 클래스를 사용하면 객체 생성을 클라이언트 코드에서 분리시켜 유연성을 높일 수 있다.

## Example
```swift
import Foundation

protocol Builder { // 복잡한 객체를 생성할 때 객체 생성 과정을 단계별로 나누어 조립하는 것이 핵심
    associatedtype T
    func build() -> T
}

struct House {
    var location: Location
    var materials: Materials
    var capacity: Capacity
}

enum Location: CaseIterable {
    case Seoul
    case Busan
    case Jukjeon
    
    var string: String {
        return "\(self)"
    }
}

enum Capacity: Int, CaseIterable {
    case one, two, three
    
    var string: String {
        return "\(self)"
    }    
}

enum Materials: CaseIterable {
    case Wood
    case Marble
    
    var string: String {
        return "\(self)"
    }
}

final class HouseBuilder: Builder { // 빌더 클래스
    
    private var location: Location
    private var materials: Materials
    private var capacity: Capacity
    
    init(location: Location, materials: Materials, capacity: Capacity) {
        self.location = location
        self.materials = materials
        self.capacity = capacity
    }
    
    func setLocation(location: Location) -> HouseBuilder {
        self.location = location
        return self
    }
    
    func setMaterials(materials: Materials) -> HouseBuilder {
        self.materials = materials
        return self
    }
    
    func setCapacity(capacity: Capacity) -> HouseBuilder {
        self.capacity = capacity
        return self
    }
    
    func build() -> House {
        return House(location: location,
                     materials: materials,
                     capacity: capacity)
    }
}
```

## Usage
```swift
    let materials = Materials.allCases
    let capacity = Capacity.allCases
    let locations = Location.allCases
    
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    let builder = builder.setLocation(location: locations[picker.selectedRow(inComponent: 0)])
            .setCapacity(capacity: capacity[picker.selectedRow(inComponent: 1)])
            .setMaterials(materials: materials[picker.selectedRow(inComponent: 2)])
            
    let newHouse = builder.build()
```
