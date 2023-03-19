# Template Method
    Template Method 패턴은 상위 클래스에서 알고리즘의 구조를 정의하고 하위 클래스에서 구체적인 구현을 결정하는 패턴이다.
    이 패턴의 핵심은 상위 클래스가 알고리즘의 골격을 제공하고 하위 클래스가 필요한 메소드를 오버라이딩하여 골격의 일부를 채우는 것이다. 
    이렇게 하면 하위 클래스에서는 전체 알고리즘을 새로 구현하지 않아도 되므로 코드 중복을 줄일 수 있다.

## Example
```swift
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        layout()
        bind()
    }
    
    func configureUI() { // 공통 작업
        view.backgroundColor = .systemBlue
    }
    
    func layout() { // 하위 클래스에서 구현
        
    }
    
    func bind() { // 하위 클래스에서 구현
        
    }
}
```

## Usage
```swift
import UIKit

class TemplateViewController: BaseViewController {
    
    @IBOutlet weak var templateLabel: UILabel!
    
    override func layout() {
        templateLabel.text = "This is Template Method.\n TemplateVC inherits from BaseVC."
    }
}
```
