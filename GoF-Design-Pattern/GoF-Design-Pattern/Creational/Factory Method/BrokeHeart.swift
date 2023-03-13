//
//  BrokeHeart.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/06.
//

import UIKit

final class BrokeHeart: Symbol {
    
    var image: UIImage? {
        return UIImage(systemName: "heart.slash.fill")
    }
    
    var describe: String {
        return "this is brokeHeartSymbol."
    }
}
