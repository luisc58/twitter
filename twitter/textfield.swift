//
//  textfield.swift
//  twitter
//
//  Created by luis castillo on 3/3/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class textfield: UITextField {

    override func awakeFromNib() {
      
        layer.borderWidth = 0.2
        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 0.2 )
        layer.borderColor = myColor.cgColor
        
    }
}
