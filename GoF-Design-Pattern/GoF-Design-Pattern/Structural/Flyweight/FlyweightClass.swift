//
//  FlyweightClass.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import Foundation

final class FlyweightClass {
    
    var address: UnsafeMutableRawPointer?
    
    init() {
        self.address = Unmanaged.passUnretained(self).toOpaque()
    }
    
}
