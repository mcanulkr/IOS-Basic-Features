//
//  SecondViewController.swift
//  deneme
//
//  Created by Muratcan on 28.11.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var changeData: UILabel!
    
    var girilenSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeData.text = girilenSifre
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
