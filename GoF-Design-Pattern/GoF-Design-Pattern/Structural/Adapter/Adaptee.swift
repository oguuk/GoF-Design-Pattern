//
//  Adaptee.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

struct Adaptee {
    
    func image() -> UIStackView {
        let image = UIImage(systemName: "person")!
        let imageView = UIImageView(image: image)
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.addArrangedSubview(imageView)
        return stackView
    }
}
