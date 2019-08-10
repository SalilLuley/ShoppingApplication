//
//  HomeViewController.swift
//  ShirtShopping
//
//  Created by Salil Luley on 08/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController : UIViewController {
    private let menuDataSource = CVMenuDataSource()
    private let tblHomeDataSource = TblHomeDataSource()
    
    lazy var cvMenu : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
        cv.backgroundColor = .white
        return cv
    }()
    
    let tblHomePage : UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
        tbl.register(YouMayAlsoLikeTableViewCell.self, forCellReuseIdentifier: YouMayAlsoLikeTableViewCell.reuseIdentifier)
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCVMenuConstraints()
        setupTblHomePage()
        self.view.backgroundColor = .white
        cvMenu.dataSource = menuDataSource
        cvMenu.delegate = menuDataSource
        
        tblHomePage.dataSource = tblHomeDataSource
        tblHomePage.delegate = tblHomeDataSource
    }
}

extension HomeViewController{
    func setupCVMenuConstraints(){
        view.addSubview(cvMenu)
        cvMenu.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.height.equalToSuperview().multipliedBy(0.1)
        }
    }
    func setupTblHomePage(){
        view.addSubview(tblHomePage)
        tblHomePage.snp.makeConstraints { (make) in
            make.top.equalTo(cvMenu.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
