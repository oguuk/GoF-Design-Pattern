//
//  AbstractFactoryViewController.swift
//  GoF-Design-Pattern
//
//  Created by 오국원 on 2023/03/07.
//

import UIKit

class AbstractFactoryViewController: UIViewController {
    
    @IBOutlet weak var leftEyeImageView: UIImageView!
    @IBOutlet weak var rightEyeImageView: UIImageView!
    @IBOutlet weak var noseImageView: UIImageView!
    @IBOutlet weak var mouthImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func manButtonDidTap(_ sender: Any) {
        let face = Artist.man.draw()
        
        leftEyeImageView.image = face.eyes
        rightEyeImageView.image = face.eyes
        noseImageView.image = face.nose
        mouthImageView.image = face.lips
    }
    
    @IBAction func womanButtonDidTap(_ sender: Any) {
        let face = Artist.woman.draw()
        
        leftEyeImageView.image = face.eyes
        rightEyeImageView.image = face.eyes
        noseImageView.image = face.nose
        mouthImageView.image = face.lips
    }
}
