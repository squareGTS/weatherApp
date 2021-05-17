//
//  UserCitiesTableViewController.swift
//  WetherGB
//
//  Created by Stanislav Belykh on 27.04.2021.
//

import UIKit

class UserCitiesTableViewController: UITableViewController {

    private var cities = [[City]]()
    private var firstLetter = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sitiesStorage = City.cities.sorted(by: { $0.name < $1.name })
        
        firstLetter = Array(Set(sitiesStorage.compactMap { String($0.name.first ?? "*") })).sorted()
        
        for letter in firstLetter {
            let forLetterCities = filterFriendByLetter(sitiesStorage, letter)
            cities.append(forLetterCities)
        }
        
        tableView.register(UINib(nibName: "CitiesTableViewCell", bundle: nil), forCellReuseIdentifier: CitiesTableViewCellXib.reuseIdentifier)
        
        tableView.register(HeaderSectionTableView.self, forHeaderFooterViewReuseIdentifier: HeaderSectionTableView.reuseId)
        
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 150))
        tableViewHeader.backgroundColor = .darkGray
        
        tableView.tableHeaderView = tableViewHeader
    }
    
    private func filterFriendByLetter(_ arr: [City], _ letter: String) -> [City] {
        return arr.filter({ String($0.name.first ?? "*") == letter })
    }

	@IBAction func addCity(segue: UIStoryboardSegue) {
		guard
			segue.identifier == "AddCity",
			let sourceController = segue.source as? AllCitiesTableViewController,
			let index = sourceController.tableView.indexPathForSelectedRow
		else {
			return
		}
        
		tableView.reloadData()
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return cities[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCellXib.reuseIdentifier, for: indexPath) as! CitiesTableViewCellXib
        let city = cities[indexPath.section][indexPath.row]
		cell.configure(city)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "WeatherCollectioViewController") as? WeatherCollectioViewController
        
        guard let destinationController = controller else {
            return
        }
        let cityName = cities[indexPath.section][indexPath.row].name
        destinationController.title = "\(cityName)"
        
        navigationController?.pushViewController(destinationController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSectionTableView.reuseId) as? HeaderSectionTableView
        let title = firstLetter[section]
        header?.configure(title: title)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		// Если была нажата кнопка «Удалить»
		if editingStyle == .delete {
			// Удаляем город из массива
			cities.remove(at: indexPath.row)
			// И удаляем строку из таблицы
			tableView.deleteRows(at: [indexPath], with: .automatic)
		}
	}
}
