//
//  StateViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/15.
//

import UIKit

class StateViewController: UIViewController {
    
    private var state: ScreenTapState = ScreenColorState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure() {
    }
    
    @IBAction func tapGestureNotify(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = state.backgroundColor()
    }
    
}
