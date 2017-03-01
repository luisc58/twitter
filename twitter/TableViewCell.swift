//
//  TableViewCell.swift
//  twitter
//
//  Created by luis castillo on 2/25/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var likeImage: UIButton!
    @IBOutlet weak var favNumber: UILabel!
    @IBOutlet weak var retNumber: UILabel!

    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
   }
}
