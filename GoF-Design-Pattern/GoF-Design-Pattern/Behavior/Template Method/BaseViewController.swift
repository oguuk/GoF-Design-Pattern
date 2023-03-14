//
//  BaseViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/14.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        layout()
        bind()
    }
    
    func configureUI() { // 공통 작업
        view.backgroundColor = .systemBlue
    }
    
    func layout() { // 하위 클래스에서 구현
        
    }
    
    func bind() { // 하위 클래스에서 구현
        
    }
}
