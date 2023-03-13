//
//  Symbol.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

protocol Symbol {
    var image: UIImage? { get }
    var describe: String { get }
}

enum SymbolType: CaseIterable {
    case heart
    case brokeHeart
}
