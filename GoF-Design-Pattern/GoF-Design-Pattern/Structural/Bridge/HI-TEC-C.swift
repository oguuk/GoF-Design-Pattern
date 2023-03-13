//
//  HI-TEC-C.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

struct HiTecC: Pen {
    
    var bold: UIFont
    var color: UIColor
    
    init(boldSize: CGFloat, color: UIColor) {
        self.bold = UIFont.boldSystemFont(ofSize: boldSize)
        self.color = color
    }
    
    func write(str: String) -> UILabel {
        let label = UILabel()
        return label
    }
}
