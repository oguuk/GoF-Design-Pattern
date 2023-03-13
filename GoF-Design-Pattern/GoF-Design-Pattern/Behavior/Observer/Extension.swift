//
//  Extension.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

extension UIImageView: ObserverProtocol {
    typealias Event = UIImage
    
    func update(event: Event?) {
        self.image = event
    }
}

extension UILabel: ObserverProtocol {
    typealias Event = String
    
    func update(event: Event?) {
        self.text = event
    }
}
