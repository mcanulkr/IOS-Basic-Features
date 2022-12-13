//
//  ChangeImageViewController.swift
//  deneme
//
//  Created by Muratcan on 28.11.2022.
//

import UIKit

class ChangeImageViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        image.addGestureRecognizer(gestureRecognizer)
    }
    

    @objc func changeImage(){
        image.image = UIImage(named: "image")
        label.text = "Food"
    }

}
