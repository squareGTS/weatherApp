//
//  AllCitiesController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class AllCitiesController: UITableViewController {
    
    let cities = ["Moscow", "Saint-Petersburg", "Nizhniy Novgorod", "Sydney", "Auckland",]
    
    let modelCities = [CityModel(cityName: "Oslo", cityEmblem: UIImage())]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }

    override func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllCitiesCell", for: indexPath)

        cell.textLabel?.text = cities[indexPath.row]
        
        return cell
    }
    
    //MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  tableView.deselectRow(at: indexPath, animated: true)
    }
}
