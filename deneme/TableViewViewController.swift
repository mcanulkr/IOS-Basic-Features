//
//  TableViewViewController.swift
//  deneme
//
//  Created by Muratcan on 28.11.2022.
//

import UIKit

class TableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var cities = [String]()
    private var cityImages = [String]()
    
    private var selectedName = ""
    private var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        cities.append("Ankara")
        cities.append("İstanbul")
        cities.append("Antalya")
        cities.append("İzmir")
        cities.append("Bursa")
        cities.append("Sivas")
        
        cityImages.append("antalya")
        cityImages.append("istanbul")
        cityImages.append("antalya")
        cityImages.append("izmir")
        cityImages.append("bursa")
        cityImages.append("sivas")
    }
    
    // numberOfRowsInsection -> Kaç tane row olacak
    // cellForRawAtIndexPath -> Hücrenin içerisinde neler gösterilecek
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }

    func tableView(_ tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath){
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            cityImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = cities[indexPath.row]
        selectedImage = cityImages[indexPath.row]
        performSegue(withIdentifier: "toTableViewDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTableViewDetail" {
            let destinationVC = segue.destination as! TableViewDetailViewController
            destinationVC.selectedCity = selectedName
            destinationVC.selectedCityImage = selectedImage
        }
    }
    
}
