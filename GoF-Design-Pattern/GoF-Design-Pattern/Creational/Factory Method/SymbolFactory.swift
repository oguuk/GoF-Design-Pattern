//
//  SymbolFactory.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

struct SymbolFactory {
    
    func createSymbol(type: SymbolType) -> Symbol? {
        switch type {
        case .heart:
            return Heart()
        case .brokeHeart:
            return BrokeHeart()
        }
    }
}
