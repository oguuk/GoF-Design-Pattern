# Composite
    Composite 패턴은 객체들을 트리 구조로 구성하여 전체-부분의 관계를 갖게 만드는 패턴이다.
    이 패턴은 Component, Leaf, Composite의 세 가지 클래스를 사용하여 구성된다. 
    Component 클래스는 객체들의 공통적인 인터페이스를 정의하고, Leaf 클래스는 단일 객체를 나타내며, Composite 클래스는 복합 객체를 나타낸다.
    Composite 클래스는 여러 개의 Component 객체를 자식으로 가질 수 있으며, 이들을 재귀적으로 구성하여 트리 구조를 만든다.
    
## Example
```swift
import UIKit

protocol DominoProtocol { // Component
    func start(_ datas: inout [UIImageView?])
}

class Square: DominoProtocol { // Leaf
    
    var isFall: Bool = false
    
    func start(_ datas: inout [UIImageView?]) {
        guard let die = datas.popLast() else { return }
        isFall.toggle()
        UIView.animate(withDuration: 1) {
            die?.tintColor = self.isFall ? .white : .tintColor
        }
    }
}

struct Domino: DominoProtocol { // Composite
    
    private var squares: [DominoProtocol] = []
    
    mutating func addSquare(domino: DominoProtocol) {
        squares.append(domino)
    }
    
    func start(_ datas: inout [UIImageView?]) {
        squares.forEach { square in
            square.start(&datas)
        }
    }
}
```

## Usage
```swift
    private var square1 = Square()
    private var square2 = Square()
    private var square3 = Square()
    private var square4 = Square()
    private var square5 = Square()
    private var square6 = Square()
    
    private var domino0 = Domino()
    private var domino1 = Domino()
    private var domino2 = Domino()
    private var domino3 = Domino()
    private var domino4 = Domino()
    private var domino5 = Domino()
    private var domino6 = Domino()
    
    @IBOutlet weak var die1: UIImageView!
    @IBOutlet weak var die2: UIImageView!
    @IBOutlet weak var die3: UIImageView!
    @IBOutlet weak var die4: UIImageView!
    @IBOutlet weak var die5: UIImageView!
    @IBOutlet weak var die6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        domino1.addSquare(domino: square1)
        domino2.addSquare(domino: square2)
        domino3.addSquare(domino: square3)
        domino4.addSquare(domino: square4)
        domino5.addSquare(domino: square5)
        domino6.addSquare(domino: square6)
        for domino in [domino1, domino2, domino3, domino4, domino5, domino6] {
            domino0.addSquare(domino: domino)
        }
    }
    
    @IBAction func startButtonDidTap(_ sender: Any) {
        var datas = [die6, die5, die4, die3, die2, die1]
        domino0.start(&datas)
    }
}
```
