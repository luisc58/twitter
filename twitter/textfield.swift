//
//  textfield.swift
//  twitter
//
//  Created by luis castillo on 3/3/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

extension NSRange {
    func range(for str: String) -> Range<String.Index>? {
        guard location != NSNotFound else { return nil }
        
        guard let fromUTFIndex = str.utf16.index(str.utf16.startIndex, offsetBy: location, limitedBy: str.utf16.endIndex) else { return nil }
        guard let toUTFIndex = str.utf16.index(fromUTFIndex, offsetBy: length, limitedBy: str.utf16.endIndex) else { return nil }
        guard let fromIndex = String.Index(fromUTFIndex, within: str) else { return nil }
        guard let toIndex = String.Index(toUTFIndex, within: str) else { return nil }
        
        return fromIndex ..< toIndex
    }
}

class textfield: UITextField {

    override func awakeFromNib() {
      
        layer.borderWidth = 0.2
        let myColor : UIColor = UIColor( red: 0.5, green: 0.5, blue:0, alpha: 0.2 )
        layer.borderColor = myColor.cgColor
        
    }
}
