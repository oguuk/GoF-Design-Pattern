//
//  HouseBuilder.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

final class HouseBuilder: Builder {
    
    private var location: Location
    private var materials: Materials
    private var capacity: Capacity
    
    init(location: Location, materials: Materials, capacity: Capacity) {
        self.location = location
        self.materials = materials
        self.capacity = capacity
    }
    
    func setLocation(location: Location) -> HouseBuilder {
        self.location = location
        return self
    }
    
    func setMaterials(materials: Materials) -> HouseBuilder {
        self.materials = materials
        return self
    }
    
    func setCapacity(capacity: Capacity) -> HouseBuilder {
        self.capacity = capacity
        return self
    }
    
    func build() -> House {
        return House(location: location,
                     materials: materials,
                     capacity: capacity)
    }
}
