//
//  HomeTableViewCell.swift
//  ShirtShopping
//
//  Created by Salil Luley on 09/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    static let reuseIdentifier = "cellId"
    private let prodcutHomeDataSource = CVProdcutHomeDataSource()
    
    lazy var cvMenu : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier)
        cv.dataSource = prodcutHomeDataSource
        cv.delegate = prodcutHomeDataSource
        cv.backgroundColor = .white
        return cv
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupcvMenuConstraints()
    }
    
    func setupcvMenuConstraints(){
        contentView.addSubview(cvMenu)
        cvMenu.snp.makeConstraints { (make) in
            make.trailing.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    
}
