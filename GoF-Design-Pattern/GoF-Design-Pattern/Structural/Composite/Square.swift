//
//  Square.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/16.
//

import UIKit

class Square: DominoProtocol {
    
    var isFall: Bool = false
    
    func start(_ datas: inout [UIImageView?]) {
        guard let die = datas.popLast() else { return }
        isFall.toggle()
        UIView.animate(withDuration: 1) {
            die?.tintColor = self.isFall ? .white : .tintColor
        }
    }
}
