//
//  TableViewController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class MyCitiesTableController: UITableViewController {
    var cities = [CityModel]()
    
    
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
       let nib = UINib(nibName: "CityCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityCell")
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as? CityCell else { return UITableViewCell() }

        cell.configure(name: cities[indexPath.row].cityName, image: cities[indexPath.row].cityEmblem)

        return cell
    }
    
    
    //MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //will do latest in that function
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        
        performSegue(withIdentifier: "showForecast", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch section {
        case 0:
            return "I'm header section 0"
        default:
            return "I'm header section"
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TableSectionHeaderView()
        headerView.configure(with: "I'm a header section")
        return headerView
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        100
//    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?  {
        let headerView = TableSectionHeaderView()
        headerView.configure(with: "I'm a footer section")
        return headerView
    }
}
