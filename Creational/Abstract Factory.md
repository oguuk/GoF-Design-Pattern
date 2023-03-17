# Abstract Factory
    Abstract Factory 패턴은 객체 생성을 위한 디자인 패턴으로, 
    구체적인 클래스를 지정하지 않고 객체를 생성하기 위한 인터페이스를 제공하여 관련 객체들의 집합을 생성하고 유지보수하는 방법을 제공한다.
    
    예를 들어, UI 컴포넌트를 만드는 팩토리는 버튼, 레이블, 텍스트 박스 등을 생성한다. 
    이 팩토리 클래스는 관련 객체들의 생성 방법을 캡슐화하고, 이를 추상화된 인터페이스를 통해 호출하는 코드와 분리시킨다.
    
    이 패턴은 객체지향 설계 원칙 중 하나인 "개방-폐쇄 원칙" (Open-Closed Principle)을 준수한다.
    
## Example
```swift
import Foundation

protocol FaceFeature {
    
    var eyes: UIImage? { get }
    var nose: UIImage? { get }
    var lips: UIImage? { get }
}

struct Man: FaceFeature {
    
    var eyes: UIImage?
    var nose: UIImage?
    var lips: UIImage?
}

struct Woman: FaceFeature {
    
    var eyes: UIImage?
    var nose: UIImage?
    var lips: UIImage?
}

protocol AbstractFactory {
    
    func draw() -> FaceFeature
}

enum Artist: AbstractFactory {
    
    case man
    case woman
    
    func draw() -> FaceFeature {
        switch self {
        case .man:
            return Man(eyes: UIImage(systemName: "eye"), nose: UIImage(systemName: "triangle"), lips: UIImage(systemName: "rectangle.grid.1x2"))
        case .woman:
            return Woman(eyes: UIImage(systemName: "eye.fill"), nose: UIImage(systemName: "triangle.fill"), lips: UIImage(systemName: "rectangle.grid.1x2.fill"))
        }
    }
}

```

## Usage
```swift
    @IBOutlet weak var leftEyeImageView: UIImageView!
    @IBOutlet weak var rightEyeImageView: UIImageView!
    @IBOutlet weak var noseImageView: UIImageView!
    @IBOutlet weak var mouthImageView: UIImageView!
    
    let manFace = Artist.man.draw()
    let womanFace = Artist.woman.draw()
    
    leftEyeImageView.image = face.eyes
    rightEyeImageView.image = face.eyes
    noseImageView.image = face.nose
    mouthImageView.image = face.lips
```
