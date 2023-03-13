//
//  Adapter.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

protocol AdapterProtocol {
    
    func change() -> UIStackView
}

struct Adapter: AdapterProtocol {
    
    private var adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    func change() -> UIStackView {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        let stackView = adaptee.image()
        stackView.distribution = .equalCentering
        stackView.addArrangedSubview(imageView)
        return stackView
    }
}
