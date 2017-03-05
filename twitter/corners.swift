//
//  corners.swift
//  twitter
//
//  Created by luis castillo on 3/3/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class corners: UIImageView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 5.2
        layer.masksToBounds = true 
    }
    
    

   }
