//
//  TblHomeDataSource.swift
//  ShirtShopping
//
//  Created by Salil Luley on 09/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import Foundation
import UIKit

class TblHomeDataSource:NSObject, UITableViewDelegate, UITableViewDataSource {
    let titleNames = ["Nike", "You may also like"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
        } else if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: YouMayAlsoLikeTableViewCell.reuseIdentifier, for: indexPath) as! YouMayAlsoLikeTableViewCell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return 100
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView : UIView = {
            let v = UIView()
            v.layer.borderWidth = 0.2
            v.layer.borderColor = UIColor.gray.cgColor
            v.backgroundColor = .white
            return v
        }()
        
        let lblSectionTitle : UILabel = {
            let lbl = UILabel()
            lbl.text = titleNames[section]
            lbl.font = UIFont.init(name: FontName.HelveticaBold.rawValue, size: 20)
            return lbl
        }()
        contentView.addSubview(lblSectionTitle)
        lblSectionTitle.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
        }
        return contentView
    }
    
    
}


