//
//  Zebra.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

struct Zebra: Pen {
    
    private(set) var ink: Ink
    
    init(ink: Ink) { self.ink = ink }
    
    func write(text: String, view: UIView) {
        if let textField = view as? UITextView { textField.text = text }
        else if let label = view as? UILabel { label.text = text }
        ink.apply(view: view)
    }
}
