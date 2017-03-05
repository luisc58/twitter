

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screenName: UILabel!
    
    
    var tweet : Tweet? {
        didSet {
        
            name.text = tweet?.username
            userImage.setImageWith((tweet?.imgUrl)!)
            screenName.text = tweet?.handle
        }
    }
}
