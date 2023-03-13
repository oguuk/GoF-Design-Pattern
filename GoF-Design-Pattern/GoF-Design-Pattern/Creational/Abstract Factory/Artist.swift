//
//  artist.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/07.
//

import UIKit

enum Artist: AbstractFactory {
    
    case man
    case woman
    
    func draw() -> FaceFeature {
        switch self {
        case .man:
            return Man(eyes: UIImage(systemName: "eye"), nose: UIImage(systemName: "triangle"), lips: UIImage(systemName: "rectangle.grid.1x2"))
        case .woman:
            return Woman(eyes: UIImage(systemName: "eye.fill"), nose: UIImage(systemName: "triangle.fill"), lips: UIImage(systemName: "rectangle.grid.1x2.fill"))
        }
    }
}
