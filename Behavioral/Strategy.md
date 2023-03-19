# Strategy
    Strategy 패턴은 알고리즘을 정의하고 각각의 알고리즘을 캡슐화하여 교체 가능하도록 만드는 패턴이다.
    실행 시간에 알고리즘을 선택하여 사용할 수 있으며, 확장성과 유지보수성이 높은 코드를 작성할 수 있다.
    
    Strategy 패턴은 다음과 같은 객체로 이루어집니다.

    Context: Strategy 객체를 사용하는 클래스로 Context 객체는 Strategy 객체를 가지고 있으며, Strategy 객체를 사용하여 작업을 수행.
    Strategy: 알고리즘을 정의하는 인터페이스로 Strategy 객체는 알고리즘을 구현.
    ConcreteStrategy: Strategy 인터페이스를 구현한 구체적인 클래스로 ConcreteStrategy 객체는 알고리즘을 구체적으로 구현.

## Example
```swift
import UIKit

protocol AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int?
}

struct InternationalAge: AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        guard let _ = dateFomatter.date(from: "\(year)-\(month)-\(day)") else { return nil }
        let birthDateComponents = DateComponents(year: year, month: month, day: day)
        guard let birthDate = Calendar.current.date(from: birthDateComponents) else { return nil }
        let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date())
        print(age)
        return age.year
    }
}

struct KoreanAge: AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        guard let _ = dateFomatter.date(from: "\(year)-\(month)-\(day)") else { return nil }
        let date = dateFomatter.string(from: Date()).split(separator: "-").compactMap { Int(String($0)) }
        let age = (date.first ?? year) - year
        return age + 1
    }
}

struct AgeCalculator {
    
    private let strategy: AgeStrategy
    
    init(strategy: AgeStrategy) {
        self.strategy = strategy
    }
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let age = strategy.birth(year: year, month: month, day: day) ?? -1
        return age < 0 ? nil : age
    }
}
```

## Usage
```swift
var international = 0
let korea = 0

let koreaAgeCalculator = AgeCalculator(strategy: KoreanAge())
let internationalAgeCalculator = AgeCalculator(strategy: InternationalAge())

let input = readLine().split(separator: "-").compactMap { Int(String($0)) }

if input.count >= 3 {
    international = internationalAgeCalculator.birth(year: input[0], month: input[1], day: input[2]) ?? -1
    korea = koreaAgeCalculator.birth(year: input[0], month: input[1], day: input[2]) ?? -1
}

print(international, korea)
```
