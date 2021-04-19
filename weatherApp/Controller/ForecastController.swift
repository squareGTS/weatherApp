//
//  ForecastController.swift
//  weatherApp
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class ForecastController: UICollectionViewController {

    var forecastModels = [ForecastModel(tempIcon: UIImage(named: "sun"), temperature: "+16", date: "today"),
                          ForecastModel(tempIcon: UIImage(named: "clouds"), temperature: "+17", date: "today"),
                          ForecastModel(tempIcon: UIImage(named: "sun"), temperature: "+18", date: "today"),
                          ForecastModel(tempIcon: UIImage(named: "clouds"), temperature: "+19", date: "today"),
                          ForecastModel(tempIcon: UIImage(named: "sun"), temperature: "+20", date: "today"),
                          ForecastModel(tempIcon: UIImage(named: "sun"), temperature: "+21", date: "today"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "View", bundle: nil)
        collectionView.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "sectionHeader")
        
        let cellNib = UINib(nibName: "ForecastCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "ForecastCell")
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCell", for: indexPath) as? ForecastCell else { return UICollectionViewCell() }
        
        
        let currentForecast = forecastModels[indexPath.item]
        cell.configure(temperature: currentForecast.temperature, tempIcon: currentForecast.tempIcon, date: currentForecast.date)
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case  UICollectionView.elementKindSectionHeader:
        print("elementKindSectionHeader")
            return UICollectionReusableView()
        case UICollectionView.elementKindSectionFooter:
            print("elementKindSectionFooter")
            return UICollectionReusableView()
        default:
         return UICollectionReusableView()
        }
    }
}

extension ForecastController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height / 2)
    }
    
    
}
