//
//  ProductsCollectionViewCell.swift
//  ShirtShopping
//
//  Created by Salil Luley on 10/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import Foundation
import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "ProductsCollectionViewCell"
    private var isFavouriteItem = true
    
    let btnFavourite: UIButton = {
        let btn = UIButton()
        return btn
    }()
    func setBtnImage(){
        if isFavouriteItem == true {
            isFavouriteItem = false
            btnFavourite.setImage(UIImage.init(named: "UnFavourite"), for: .normal)
        } else {
            isFavouriteItem = true
            btnFavourite.setImage(UIImage.init(named: "Favourite"), for: .normal)
        }
    }
    @objc func btnFavouriteTapped(sender: UIButton){
        setBtnImage()
    }
    
    let ivProducts : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage.init(named: "Shoe1")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    let lblPrice : UILabel = {
        let lbl  = UILabel()
        lbl.text = "$190"
        lbl.textColor = .white
        return lbl
    }()
    
    let lblName : UILabel = {
        let lbl  = UILabel()
        lbl.text = "Nike Vapromax"
        lbl.textColor = .white
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupIVProductsConstraints()
        setupLblPriceConstraints()
        setupLblNameConstraints()
        setupBtnFavouriteConstraints()
        setBtnImage()
        ivProducts.setBlackGradient()
        btnFavourite.addTarget(self, action: #selector(btnFavouriteTapped(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIVProductsConstraints(){
        contentView.addSubview(ivProducts)
        ivProducts.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupLblNameConstraints(){
        ivProducts.addSubview(lblName)
        lblName.snp.makeConstraints { (make) in
            make.leading.equalTo(ivProducts).offset(20)
            make.bottom.equalTo(lblPrice.snp.top).offset(-10)
        }
    }
    func setupLblPriceConstraints(){
        ivProducts.addSubview(lblPrice)
        lblPrice.snp.makeConstraints { (make) in
            make.leading.equalTo(ivProducts).offset(20)
            make.bottom.equalTo(ivProducts).offset(-20)
        }
    }
    func setupBtnFavouriteConstraints(){
        contentView.addSubview(btnFavourite)
        btnFavourite.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
        }
    }
}

extension ProductsCollectionViewCell {
    func setValuesForDetailScreen(){
        lblName.isHidden = true
        lblPrice.isHidden = true
        btnFavourite.isHidden = true
    }
}

