//
//  FaceFeature.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/07.
//

import UIKit

protocol FaceFeature {
    
    var eyes: UIImage? { get }
    var nose: UIImage? { get }
    var lips: UIImage? { get }
}
