//
//  Color.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/21.
//

import UIKit

struct Color: Ink {
    
    var bold: UIFont
    var color: UIColor
    
    func apply(view: UIView) {
        if let textField = view as? UITextView {
            textField.font = bold
            textField.textColor = color
        } else if let label = view as? UILabel {
            label.font = bold
            label.textColor = color
        }
    }
}
