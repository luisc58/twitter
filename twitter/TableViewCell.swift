//
//  TableViewCell.swift
//  twitter
//
//  Created by luis castillo on 2/25/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class {
    func onRetweet(for cell:TableViewCell)
    func onFavorite(for cell:TableViewCell)
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userTweet: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var likeImage: UIButton!
    @IBOutlet weak var favNumber: UILabel!
    @IBOutlet weak var retNumber: UILabel!
    @IBOutlet weak var retweetIcon: UIButton!
    
    
    weak var delegate: TableViewCellDelegate?
    var indexpath : IndexPath?
    
    
    var tweet : Tweet! {
        didSet {
            
            if tweet.favorited!  {
                likeImage.setImage(UIImage(named: "favor-icon-red"), for: .normal)
                
            }
            else{
                likeImage.setImage(UIImage(named: "favor-icon"), for: .normal)
                 
            }
            
            if tweet.favorited! && tweet.favoritesCount == 0 { tweet.favoritesCount += 1 }
            
            
            if tweet.retweeted!{
                retweetIcon.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            }
            else{
                retweetIcon.setImage(UIImage(named: "retweet-icon"), for: .normal)
            }
                      
            favNumber.text = "\(tweet.favoritesCount)"
            retNumber.text = "\(tweet.retweetCount)"
        }
        
        
    }
        
    
            
    override func awakeFromNib() {
        super.awakeFromNib()
      
   }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
    @IBAction func onFavorite(_ sender: Any) {
       
    delegate?.onFavorite(for: self)
        
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        delegate?.onRetweet(for: self)
    }
    
    

}
