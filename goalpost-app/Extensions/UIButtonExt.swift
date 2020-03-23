//
//  UIButtonExt.swift
//  goalpost-app
//
//  Created by abdulrahman on 11/12/18.
//  Copyright © 2018 abdulrahmanAbdou. All rights reserved.
//

import UIKit

extension UIButton{
    
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
}
