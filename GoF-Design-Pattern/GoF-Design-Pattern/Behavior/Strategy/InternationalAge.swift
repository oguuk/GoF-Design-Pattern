//
//  InternationalAge.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/08.
//

import Foundation

struct InternationalAge: AgeStrategy {
    
    func birth(year: Int, month: Int, day: Int) -> Int? {
        let dateFomatter = DateFormatter()
        dateFomatter.dateFormat = "yyyy-MM-dd"
        guard let _ = dateFomatter.date(from: "\(year)-\(month)-\(day)") else { return nil }
        let birthDateComponents = DateComponents(year: year, month: month, day: day)
        guard let birthDate = Calendar.current.date(from: birthDateComponents) else { return nil }
        let age = Calendar.current.dateComponents([.year], from: birthDate, to: Date())
        print(age)
        return age.year
    }
}
