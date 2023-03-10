//
//  Building.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/10.
//

import Foundation
import UIKit

final class Building: Prototype {
    
    let name: String = "강남빌딩"
    let image = UIImageView.init(image: UIImage(systemName: "building.fill")!)
    var price: Int = 0
    
    func clone() -> Building {
        return Building()
    }
}
