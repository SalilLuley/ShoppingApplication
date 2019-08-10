//
//  YouMayAlsoLikeTableViewCell.swift
//  ShirtShopping
//
//  Created by Salil Luley on 10/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import UIKit

class YouMayAlsoLikeTableViewCell: UITableViewCell {
    static let reuseIdentifier = "YouMayAlsoLikeTableViewCell"
    
    let ivProduct : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Shoe2")
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    let lblName : UILabel = {
        let lbl = UILabel()
        lbl.text = "Nike Vapormax2"
        return lbl
    }()
    let lblPrice : UILabel = {
        let lbl = UILabel()
        lbl.text = "$120"
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupIVProduct()        
        setupNameAndPrice()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupIVProduct(){
        contentView.addSubview(ivProduct)
        ivProduct.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    func setupNameAndPrice(){        
        let svNameAndPrice = UIStackView.init(arrangedSubviews: [lblName, lblPrice])
        svNameAndPrice.distribution = .fillEqually
        svNameAndPrice.axis = .vertical
        svNameAndPrice.alignment = .leading
        svNameAndPrice.spacing = 0
        contentView.addSubview(svNameAndPrice)
        svNameAndPrice.snp.makeConstraints { (make) in
            make.leading.equalTo(ivProduct.snp.trailing).offset(15)
            make.top.bottom.equalTo(ivProduct)
            make.trailing.equalTo(contentView).offset(10)
        }
    }
}
