//
//  Invoker.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class Invoker {
    
    var command: Command?
    
    func commandExecute() {
        command?.execute()
    }
    
    func commandUndo() {
        command?.undo()
    }
}
