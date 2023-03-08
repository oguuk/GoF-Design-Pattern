//
//  House.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

struct House {
    var location: Location
    var materials: Materials
    var capacity: Capacity
}

enum Location: CaseIterable {
    case Seoul
    case Busan
    case Jukjeon
    
    var string: String {
        return "\(self)"
    }
}

enum Capacity: Int, CaseIterable {
    case one, two, three
    
    var string: String {
        return "\(self)"
    }    
}

enum Materials: CaseIterable {
    case Wood
    case Marble
    
    var string: String {
        return "\(self)"
    }
}
