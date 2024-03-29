//
//  Ink.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

protocol Ink {
    var bold: UIFont { get set }
    var color: UIColor { get set }
    
    func apply(view: UIView)
}
