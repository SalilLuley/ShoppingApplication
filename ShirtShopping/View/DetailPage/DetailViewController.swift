//
//  DetailViewController.swift
//  ShirtShopping
//
//  Created by Salil Luley on 11/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private let cvProdctDetailDataSource = CVProdctDetailDataSource()
    let scrollview : UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let cvProductDetail: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier)
        cv.layer.cornerRadius = 30
        cv.isPagingEnabled = true
        
        return cv
    }()
    
    let svAvailableSizes : UIStackView = {
        let sv = UIStackView.init()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let svBasket : UIStackView = {
        let sv = UIStackView.init()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let lblName : UILabel = {
        let lbl = UILabel()
        lbl.text = "Nike Vapormax"
        return lbl
    }()
    
    let lblPrice : UILabel = {
        let lbl = UILabel()
        lbl.text = "$190"
        return lbl
    }()
    
    let lblAvailableSizes: UILabel = {
        let lbl = UILabel()
        lbl.text = "Available Size"
        return lbl
    }()
    
    let btnSizeSmall : UIButton = {
        let btn = UIButton()
        btn.setTitle(" S ", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        btn.setTitleColor(UIColor.init(red: 206/255, green: 206/255, blue: 207/255, alpha: 1), for: .normal)
        return btn
    }()
    let btnSizeMedium : UIButton = {
        let btn = UIButton()
        btn.setTitle(" M ", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        btn.setTitleColor(UIColor.init(red: 206/255, green: 206/255, blue: 207/255, alpha: 1), for: .normal)
        return btn
    }()
    let btnSizeLarge : UIButton = {
        let btn = UIButton()
        btn.setTitle(" L ", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        btn.setTitleColor(UIColor.init(red: 206/255, green: 206/255, blue: 207/255, alpha: 1), for: .normal)
        return btn
    }()
    let btnSizeExtraLarge : UIButton = {
        let btn = UIButton()
        btn.setTitle(" XL ", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        btn.setTitleColor(UIColor.init(red: 206/255, green: 206/255, blue: 207/255, alpha: 1), for: .normal)
        return btn
    }()
    
    let btnAddToBasket: UIButton = {
        let btn = UIButton()
        btn.setTitle(" Add to Basket ", for: .normal)
        btn.layer.cornerRadius = 10
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.black//UIColor.init(red: 31/255, green: 165/255, blue: 98/255, alpha: 1)
        return btn
    }()
    
    let btnGoToBasket: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 10
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.init(red: 244/255, green: 244/255, blue: 249/255, alpha: 1)
        btn.setImage(UIImage(named: "btnGotoBasket"), for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraints()
        view.backgroundColor = .white
        cvProductDetail.dataSource = cvProdctDetailDataSource
        cvProductDetail.delegate = cvProdctDetailDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        scrollview.updateContentView()
    }
    
}

extension DetailViewController{
    
    func setNavigationBar(){
        navigationController.navigationBar.prefersLargeTitles = false
    }
    
    func addConstraints(){
        setupScrollviewConstraints()
        setupCVConstraints()
        setupLblNameConstraints()
        setupLblPriceConstraints()
        setupLblAvailableSizesConstraints()
        setupSVForAvailableSizes()
        setupSVForBasket()
    }
    
    func setupScrollviewConstraints(){
        view.addSubview(scrollview)
        scrollview.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setupCVConstraints(){
        scrollview.addSubview(cvProductDetail)
        cvProductDetail.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.height.equalTo(view).multipliedBy(0.5)
        }
    }
    func setupLblNameConstraints(){
        scrollview.addSubview(lblName)
        lblName.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(cvProductDetail.snp.bottom).offset(15)
            make.trailing.equalToSuperview().offset(10)
        }
    }
    
    func setupLblPriceConstraints(){
        scrollview.addSubview(lblPrice)
        lblPrice.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(lblName.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(10)
        }
    }
    func setupLblAvailableSizesConstraints(){
        scrollview.addSubview(lblAvailableSizes)
        lblAvailableSizes.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(lblPrice.snp.bottom).offset(60)
            make.trailing.equalToSuperview().offset(10)
        }
    }
  
    func createStackView() -> UIStackView{
        svAvailableSizes.addArrangedSubview(btnSizeSmall)
        svAvailableSizes.addArrangedSubview(btnSizeMedium)
        svAvailableSizes.addArrangedSubview(btnSizeLarge)
        svAvailableSizes.addArrangedSubview(btnSizeExtraLarge)
        svAvailableSizes.axis = .horizontal
        svAvailableSizes.spacing = 10
        svAvailableSizes.alignment = .leading
        svAvailableSizes.distribution = .fill
        return svAvailableSizes
    }
    
    func createSVBasket() -> UIStackView {
        svBasket.addArrangedSubview(btnAddToBasket)
        svBasket.addArrangedSubview(btnGoToBasket)
        svBasket.axis = .horizontal
        svBasket.spacing = 10
        svBasket.alignment = .fill
        svBasket.distribution = .fillProportionally
        return svBasket
    }
    
    
    func setupSVForAvailableSizes(){
        let svAvailableSizes = createStackView()
        scrollview.addSubview(svAvailableSizes)
        svAvailableSizes.snp.makeConstraints { (make) in
            make.leading.equalTo(lblAvailableSizes.snp.leading)
            make.top.equalTo(lblAvailableSizes.snp.bottom).offset(15)
            make.trailing.equalToSuperview().multipliedBy(0.7)
            make.height.equalToSuperview().multipliedBy(0.07)
        }
    }
    
    func setupSVForBasket(){
        let svBasket = createSVBasket()
        view.addSubview(svBasket)
        svBasket.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalToSuperview().multipliedBy(0.07)
        }
    }
}
