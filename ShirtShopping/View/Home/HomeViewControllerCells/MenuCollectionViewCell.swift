//
//  MenuCollectionViewCell.swift
//  ShirtShopping
//
//  Created by Salil Luley on 08/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "cellId"
    let lblMenu : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.init(name: FontName.HelveticaBold.rawValue, size: 14)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBtnMenuConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuCollectionViewCell {
    func setupBtnMenuConstraints(){
        contentView.addSubview(lblMenu)
        lblMenu.snp.makeConstraints { (make) in
            make.center.equalTo(contentView)
        }
    }
}

extension MenuCollectionViewCell{
    
    func setValues(data: [String], indexPath: IndexPath){
        setBtnMenuTitle(title: data[indexPath.row])
    }
    
    func setBtnMenuTitle(title: String){
        lblMenu.text = title
    }
}
