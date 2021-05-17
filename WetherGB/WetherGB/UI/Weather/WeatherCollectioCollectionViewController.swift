//
//  WeatherCollectioCollectionViewController.swift
//  WetherGB
//
//  Created by Stanislav Belykh on 27.04.2021.
//

import UIKit

class WeatherCollectioViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.reuseID, for: indexPath) as! WeatherCollectionCell

		cell.tempLabel.text = "\(indexPath.row) ℃"
		cell.timeLabel.text = "27.04.2021"

        return cell
    }
}
