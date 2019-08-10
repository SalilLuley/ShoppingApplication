//
//  File.swift
//  ShirtShopping
//
//  Created by Salil Luley on 08/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//
import Foundation
import UIKit

class CVMenuDataSource:NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    let arrBrandNames = ["Nike","Vans","Adidas","Converse","Under Armour","Steve Madden",]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBrandNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
        cell.setValues(data: arrBrandNames, indexPath: indexPath)
        cell.lblMenu.textColor = indexPath.row == 0 ? .black : .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = arrBrandNames[indexPath.row].size(withAttributes : nil)
        return CGSize.init(width: (size.width + 100), height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell else { return }
        cell.lblMenu.textColor = .black
    }
    
}
