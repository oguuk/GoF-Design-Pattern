//
//  Light.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class Lighter {
    var light: Light = .Off
}

enum Light: String {
    case On = "lightbulb.fill"
    case Off = "lightbulb"
}
