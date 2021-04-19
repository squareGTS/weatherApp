//
//  AllCitiesController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class AllCitiesController: UITableViewController {
    
    @IBOutlet weak var headerView: UIView!
    
    let cities = [CityModel(cityName: "Moscow", cityEmblem: UIImage(named: "mo")),
                  CityModel(cityName: "Saint-Petersburg", cityEmblem: UIImage(named: "spb")),
                  CityModel(cityName: "Nizhniy Novgorod", cityEmblem: UIImage(named: "nn")),
                  CityModel(cityName: "Sydney", cityEmblem: UIImage(named: "sy")),
                  CityModel(cityName: "Auckland", cityEmblem: UIImage(named: "au")),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CityCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityCell")
        
        tableView.tableHeaderView = headerView
        //tableView.tableFooterView = headerView

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }

    override func tableView(_ collectionView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }

        cell.configure(name: cities[indexPath.row].cityName, image: cities[indexPath.row].cityEmblem)
        
        return cell
    }
    
    //MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addCity", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
