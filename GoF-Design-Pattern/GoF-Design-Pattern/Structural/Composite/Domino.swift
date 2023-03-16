//
//  Domino.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/16.
//

import UIKit

struct Domino: DominoProtocol {
    
    private var squares: [DominoProtocol] = []
    
    mutating func addSquare(domino: DominoProtocol) {
        squares.append(domino)
    }
    
    func start(_ datas: inout [UIImageView?]) {
        squares.forEach { square in
            square.start(&datas)
        }
    }
}
