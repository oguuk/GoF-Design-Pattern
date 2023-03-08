//
//  KoreanAge.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

struct KoreanAge: AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        guard let _ = dateFomatter.date(from: "\(year)-\(month)-\(day)") else { return nil }
        let date = dateFomatter.string(from: Date()).split(separator: "-").compactMap { Int(String($0)) }
        let age = (date.first ?? year) - year
        return age + 1
    }
}
