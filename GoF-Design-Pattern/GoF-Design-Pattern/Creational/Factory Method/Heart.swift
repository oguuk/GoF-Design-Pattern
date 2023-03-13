//
//  Heart.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

final class Heart: Symbol {
    
    var image: UIImage? {
        return UIImage(systemName: "heart.fill")
    }
    
    var describe: String {
        return "this is heartSymbol."
    }
}
