//
//  AdapterViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

class AdapterViewController: UIViewController {
    
    private let adaptee = Adaptee()
    @IBOutlet weak var adapteeView: UIView!
    @IBOutlet weak var adapterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = adaptee.image()
        image.translatesAutoresizingMaskIntoConstraints = false
        adapteeView.addSubview(image)
        image.centerXAnchor.constraint(equalTo: adapteeView.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: adapteeView.centerYAnchor).isActive = true
    }
    
    @IBAction func makeFriend(_ sender: Any) {
        let adapter = Adapter(adaptee: adaptee)
        let image = adapter.change()
        image.translatesAutoresizingMaskIntoConstraints = false
        adapterView.addSubview(image)
        image.centerXAnchor.constraint(equalTo: adapterView.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: adapterView.centerYAnchor).isActive = true
    }
}
