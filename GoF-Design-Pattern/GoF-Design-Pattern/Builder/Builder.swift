//
//  Builder.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

protocol Builder { // 복잡한 객체를 생성할 때 객체 생성 과정을 단계별로 나누어 조립하는 것이 핵심
    associatedtype T
    func build() -> T
}
