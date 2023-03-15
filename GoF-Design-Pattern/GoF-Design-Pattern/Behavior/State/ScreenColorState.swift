//
//  ScreenColorState.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

struct ScreenColorState: ScreenTapState {
    
    var tapTimes: Int = 0
    var colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemBlue, .purple]
    
    mutating func backgroundColor() -> UIColor {
        tapTimes %= colors.count
        defer { tapTimes += 1 }
        return colors [tapTimes]
    }
}
