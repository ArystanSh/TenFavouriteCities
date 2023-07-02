//
//  ViewController.swift
//  TenFavouriteCities
//
//  Created by Arystan Sharafiyev  on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var citiesTableView: UITableView!
    
    var cities = ["Rome", "Istanbul", "Venice", "Marburg", "Frankfurt", "Erfurt", "Drezden", "Prague", "Milan", "Padua"]
    
    var citiesAndCountries = ["Rome": "Italy", "Istanbul": "Turkey", "Venice": "Italy", "Marburg": "Germany", "Frankfurt": "Germany", "Erfurt": "Germany", "Drezden": "Germany", "Prague": "Czech Republic", "Milan": "Italy", "Padua": "Italy"]
    
    struct Constants {
        static let cellIdentifier = "MagicCityCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        citiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = citiesAndCountries[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cityName = cities[indexPath.row]
         let countryName = citiesAndCountries[cityName] ?? ""
         print("Selected city: \(cityName), Country: \(countryName)")
     }
}
