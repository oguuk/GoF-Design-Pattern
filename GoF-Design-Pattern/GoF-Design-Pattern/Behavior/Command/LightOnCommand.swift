//
//  LightOnCommand.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

struct LightOnCommand: Command {
    
    private let lighter: Lighter
    
    init(lighter: Lighter) {
        self.lighter = lighter
    }
    
    func execute() {
        lighter.light = .On
    }
    
    func undo() {
        lighter.light = .Off
    }
}
