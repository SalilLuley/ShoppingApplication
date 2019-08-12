//
//  ExtNSObject.swift
//  ShirtShopping
//
//  Created by Salil Luley on 11/08/19.
//  Copyright © 2019 Salil Luley. All rights reserved.
//

import Foundation
import UIKit
extension NSObject {
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var application: UIApplication{
        return UIApplication.shared
    }
    var navigationController : UINavigationController {
        return application.windows[0].rootViewController as! UINavigationController
    }
}
