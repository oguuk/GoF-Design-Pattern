//
//  State.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

protocol ScreenTapState {
    var tapTimes: Int { get set }
    var colors: [UIColor] { get set }
    mutating func backgroundColor() -> UIColor
}
