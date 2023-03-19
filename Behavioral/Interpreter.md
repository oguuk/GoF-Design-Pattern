# Interpreter
    Interpreter 패턴은 언어나 문법을 해석하는데 사용되는 패턴으로, 특정한 문법을 가진 문장을 해석하고 실행하는 인터프리터를 구현할 수 있다.
    
    이 패턴은 다음과 같은 객체들로 이루어져 있다.
    
    AbstractExpression: 인터프리터에서 사용되는 추상 클래스. 문법 규칙을 나타내는 역할
    TerminalExpression: 구체적인 AbstractExpression 클래스. 실제 해석을 담당하는 클래스
    NonterminalExpression: 구체적인 AbstractExpression 클래스. 여러 개의 AbstractExpression 객체를 조합하여 복잡한 문법을 해석
    Context: 인터프리터에서 사용되는 정보를 저장하는 클래스
    
## Example
```swift
import UIKit

protocol Expression {
    func interpreter(_ context: IntergerContext) -> Int?
}

final class IntergerContext {
    
    private var variables: [String: Int] = [:]
    
    func getValue(for key: VariableExpression) -> Int? {
        return variables[key.name]
    }
    
    func setValue(_ value: Int, for key: VariableExpression) {
        variables[key.name] = value
    }
}

struct AddExpression: Expression { //  더하기
    
    private let left: Expression
    private let right: Expression
    
    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }
    
    func interpreter(_ context: IntergerContext) -> Int? {
        guard let left = left.interpreter(context) else { return nil }
        guard let right = right.interpreter(context) else  { return nil }
        return left  + right
    }
}

struct MultiplicationExpression: Expression { // 곱하기
    
    private let left: Expression
    private let right: Expression
    
    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }
    
    func interpreter(_ context: IntergerContext) -> Int? {
        guard let left = left.interpreter(context) else { return nil }
        guard let right = right.interpreter(context) else  { return nil }
        return left  * right
    }
}

struct SubstractionExpression: Expression { //  빼기
    
    private let left: Expression
    private let right: Expression
    
    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }
    
    func interpreter(_ context: IntergerContext) -> Int? {
        guard let left = left.interpreter(context) else { return nil }
        guard let right = right.interpreter(context) else  { return nil }
        return left  - right
    }
}

struct VariableExpression: Expression { // Int 객체
    
    let name: String
    
    func interpreter(_ context: IntergerContext) -> Int? {
        return context.getValue(for: self)
    }
}
```

## Usage
```swift

// first + second - third * fourth 를 표현
let intergetContext = IntergerContext()

let firstVariable = VariableExpression(name: "first")
let secondVariable = VariableExpression(name: "second")
let thirdVariable = VariableExpression(name: "third")
let fourthVariable = VariableExpression(name: "fourth")

intergetContext.setValue(1, firstVariable)
intergetContext.setValue(2, secondVariable)
intergetContext.setValue(3, thirdVariable)
intergetContext.setValue(4, fourthVariable)

let multuply = MultiplicationExpression(thirdVariable, fourthVariable)
let add = AddExpression(firstVariable, secondVariable)
let result = SubstractionExpression(add, multuply).interpreter(intergetContext)
```
