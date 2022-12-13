//
//  ViewController.swift
//  deneme
//
//  Created by Muratcan on 26.11.2022.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var goToOtherVC: UIButton!
    @IBOutlet weak var getSaveData: UILabel!
    @IBOutlet weak var enterData: UITextField!
    @IBOutlet weak var goToTableView: UIButton!
    @IBOutlet weak var enterData1: UITextField!
    @IBOutlet weak var saveData: UIButton!
    @IBOutlet weak var deleteData: UIButton!
    @IBOutlet weak var showAlert: UIButton!
    @IBOutlet weak var changeImage: UIButton!
    
    private var alinanSifre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.largeContentTitle = "View"
        
        // Text Field
        enterData.layer.cornerRadius = 10
        enterData.layer.borderWidth = 1.5
        enterData.layer.borderColor = UIColor.gray.cgColor
        enterData.placeholder = "Diğer Sayfaya Gönderilecek Veri"
        enterData.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: enterData.frame.height))
        enterData.leftViewMode = .always
        
        // Go to Other ViewController Button
        goToOtherVC.tintColor = UIColor.white
        goToOtherVC.layer.cornerRadius = 10
        goToOtherVC.layer.backgroundColor = UIColor.gray.cgColor
        goToOtherVC.layer.masksToBounds = false
        goToOtherVC.layer.shadowOpacity = 1.0
        goToOtherVC.layer.shadowRadius = 10
        goToOtherVC.layer.shadowOffset = CGSize(width: 0, height: 10)
        goToOtherVC.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        // Save Data Button
        saveData.layer.cornerRadius = 10
        saveData.layer.backgroundColor = UIColor.gray.cgColor
        saveData.layer.masksToBounds = false
        saveData.layer.shadowOpacity = 4.0
        saveData.layer.shadowRadius = 10
        saveData.layer.shadowOffset = CGSize(width: 0, height: 10)
        saveData.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        saveData.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        // Delete Data Button
        deleteData.layer.cornerRadius = 10
        deleteData.layer.backgroundColor = UIColor.systemRed.cgColor
        deleteData.layer.masksToBounds = false
        deleteData.layer.shadowOffset = CGSize(width: 0, height: 10)
        deleteData.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        deleteData.layer.shadowRadius = 10
        deleteData.layer.shadowOpacity = 4.0
        deleteData.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        // Show Alert Button
        showAlert.layer.cornerRadius = 10
        showAlert.layer.backgroundColor = UIColor.systemGreen.cgColor
        showAlert.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        showAlert.layer.masksToBounds = false
        showAlert.layer.shadowOffset = CGSize(width: 0, height: 10)
        showAlert.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        showAlert.layer.shadowRadius = 10
        showAlert.layer.shadowOpacity = 4.0
        
        // Go To Change Image View Controller
        changeImage.layer.cornerRadius = 10
        changeImage.layer.backgroundColor = UIColor.systemBlue.cgColor
        changeImage.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        changeImage.layer.masksToBounds = false
        changeImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        changeImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        changeImage.layer.shadowRadius = 10
        changeImage.layer.shadowOpacity = 4.0
        
        // Enter Data 1 Text Field
        enterData1.placeholder = "Kaydedilecek Veri"
        enterData1.layer.cornerRadius = 10
        enterData1.layer.borderWidth = 1.5
        enterData1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: enterData1.frame.height))
        enterData1.leftViewMode = .always
        enterData1.layer.borderColor = UIColor.gray.cgColor
        
        // Go To TableView View Controller
        goToTableView.layer.cornerRadius = 10
        goToTableView.layer.backgroundColor = UIColor.systemTeal.cgColor
        goToTableView.tintColor = UIColor.white
        goToTableView.layer.masksToBounds = false
        goToTableView.layer.shadowOffset = CGSize(width: 0, height: 10)
        goToTableView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        goToTableView.layer.shadowRadius = 10
        goToTableView.layer.shadowOpacity = 4.0
        
        let savedData = UserDefaults.standard.object(forKey: "data")
        
        if let data = savedData as? String {
            getSaveData.text = "Kaydedilen Veri : \(data)"
        }
    }

    
    // Show alert button action
    @IBAction func alert(_ sender: Any) {
        let uyariMesaji = UIAlertController(title: "Hata Mesajı", message: "Şifre Yanlış", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default){ (UIAlerAction) in
            
        }
        
        uyariMesaji.addAction(okButton)
        self.present(uyariMesaji, animated: true)
    }
    
    // Go to change image view controller action
    @IBAction func changeImage(_ sender: Any) {
        performSegue(withIdentifier: "toChangeImageVC", sender: nil)
    }
    
    // Save data action
    @IBAction func saveData(_ sender: Any) {
        UserDefaults.standard.set(enterData1.text!, forKey: "data")
        getSaveData.text = "Kaydedilen Veri : \(enterData1.text! as String)"
    }
    
    // Delete data action
    @IBAction func deleteData(_ sender: Any) {
        let getData = UserDefaults.standard.object(forKey: "data")
        
        if (getData as? String != nil){
            UserDefaults.standard.removeObject(forKey: "data")
            getSaveData.text = "Kaydedilen Veri :"
        }
    }
    
    // Go to other view controller action
    @IBAction func goToSecondVC(_ sender: Any) {
        alinanSifre = enterData.text!
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    
    // Go to tableview view controller action
    @IBAction func goToTableViewVC(_ sender: Any) {
        performSegue(withIdentifier: "toTableViewVC", sender: nil)
    }
    
    // Use pass data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSecondViewController"){
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.girilenSifre = alinanSifre
        }
    }
    
}

