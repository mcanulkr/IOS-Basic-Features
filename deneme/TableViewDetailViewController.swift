//
//  TableViewDetailViewController.swift
//  deneme
//
//  Created by Muratcan on 28.11.2022.
//

import UIKit

class TableViewDetailViewController: UIViewController {
    
    @IBOutlet weak var detailCityName: UILabel!
    @IBOutlet weak var detailCityImage: UIImageView!
    
    var selectedCity = ""
    var selectedCityImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailCityImage.image = UIImage(named: selectedCityImage)
        detailCityName.text = selectedCity
    }
    
}
