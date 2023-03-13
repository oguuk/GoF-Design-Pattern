//
//  FacadeViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/13.
//

import UIKit

class FacadeViewController: UIViewController {
    
    private var facade: Downloader = Downloader()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goButtonDidTap(_ sender: Any) {
        facade.fetch(url: urlTextField.text ?? "") { data in
            var image = UIImage(systemName: "photo.fill")
            if let data = data, let imageData = UIImage(data: data) {
                print("image setting complete")
                image = imageData
            }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
