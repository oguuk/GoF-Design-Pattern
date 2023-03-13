//
//  Pen.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import Foundation
import UIKit

protocol Pen: Ink {
    
    func write(str: String) -> UILabel
}
