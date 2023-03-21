# Adapter
    Adapter 패턴은 두 개의 인터페이스가 호환되지 않을 때 그 사이에서 어댑터 역할을 수행하여 두 인터페이스 간의 상호 작용이 가능하도록 해주는 디자인 패턴이다.
    
    1. 기존 코드에 새로운 인터페이스를 적용해야 할 때
    2. 이미 개발된 코드와 외부 라이브러리를 함께 사용해야 할 때
    3. 호환되지 않는 두 개의 클래스를 연결해야 할 때 유용하다.
    
    Adapter 패턴은 상속을 통한 클래스 어댑터 패턴과 컴포지션을 통한 객체 어댑터 패턴으로 나뉜다.
    
    
## Example
```swift
import Foundation

protocol AdapterProtocol {
    
    func change() -> UIStackView
}

struct Adapter: AdapterProtocol {
    
    private var adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    func change() -> UIStackView {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        let stackView = adaptee.image()
        stackView.distribution = .equalCentering
        stackView.addArrangedSubview(imageView)
        return stackView
    }
}

struct Adaptee {
    
    func image() -> UIStackView {
        let image = UIImage(systemName: "person")!
        let imageView = UIImageView(image: image)
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.addArrangedSubview(imageView)
        return stackView
    }
}
```

## Usage
```swift
let adaptee = Adaptee()
@IBOutlet weak var adapteeView: UIView!
@IBOutlet weak var adapterView: UIView!

let image = adaptee.image()
adapteeView.addSubview(image)

let adapter = Adapter(adaptee: adaptee)
let image = adapter.change()
adapterView.addSubview(image)
```

# More
    Adaptee 객체와 클라이언트 사이의 인터페이스 호환성이 없습니다. 
    Adapter 객체는 Adaptee 객체를 감싸고 AdapterProtocol을 구현하여, Adaptee 객체의 image() 메소드를 호출하고 반환된 UIStackView 객체를 클라이언트에게 반환한다. 
    이러한 방식으로 Adapter 객체는 Adaptee 객체와 클라이언트 사이의 인터페이스 호환성을 제공하고, 클라이언트는 Adaptee 객체의 내부 구현을 몰라도 된다.

#### Decorator와 Adapter의 차이

Adapter 패턴과 Decorator 패턴은 둘 다 객체를 감싸 새로운 동작을 추가하는 패턴이지만, 목적과 사용 방법에서 차이가 있다.

- 데코레이터 패턴 : 객체에 동적으로 기능을 추가하는 방법을 제공
- 어댑터 패턴: 두 개의 인터페이스가 호환되지 않을 때 사용
