//
//  ExtUIImage.swift
//  ShirtShopping
//
//  Created by Salil Luley on 11/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func addBlackGradientLayer(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
    
    func setBlackGradient(with frame : CGRect)
    {
        // Add new layer
        let colorTop1 =  UIColor.clear
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5).cgColor
        let colorBottom1 = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.9).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop1, colorTop, colorBottom1, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = frame
        self.layer.addSublayer(gradientLayer)
    }
    
    func setBlackGradient()
    {
        self.setBlackGradient(with: self.bounds)
    }
}

