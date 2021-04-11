//
//  TableViewController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class MyCitiesTableController: UITableViewController {
    var cities = [String]()
    
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        guard segue.identifier == "addCity",
              let allCitiesController = segue.source as? AllCitiesController,
              let indexPath = allCitiesController.tableView.indexPathForSelectedRow
        else { return }
       
        let city = allCitiesController.cities[indexPath.row]
        if !cities.contains(city) {
            cities.append(city)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }

        let currentCity = cities[indexPath.row]
        cell.textLabel?.text = currentCity
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }
    
    
    //MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
