//
//  Collection.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import Foundation

class Collection<DataType>: Iterator {
    
    typealias T = DataType
    
    private var collection: [T]
    private var index: Int = 0
    
    init(collection: [T]) {
        self.collection = collection
    }
    
    func next() -> DataType? {
        if collection.endIndex <= index { return nil }
        defer { index += 1 }
        return collection[index]
    }
    
    func prev() -> DataType? {
        if collection.count == 0 || index - 1 < 0 { return nil }
        defer { index -= 1 }
        return collection[index - 1]
    }
}
