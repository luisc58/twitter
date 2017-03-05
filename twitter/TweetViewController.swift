
import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var favorites: UILabel!
    @IBOutlet weak var retweets: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var tweets : Tweet! 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewloaded()
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reply", style: .plain, target: self, action: #selector(reply))
    }

    func reply() {}
    
    private func viewloaded() {                                     //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
                                                                    //[HERE I CREATED A SEPARATE FUNC AND THEN CALLED IT IN VIEWDIDLOAD]
        username.text = tweets.username                             //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        userImage.setImageWith(tweets.imgUrl!)
        screenName.text = tweets.handle
        tweetText.text = tweets.text
        
        if tweets.favorited!  { likeButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        }
        else{
            likeButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
        
        if tweets.retweeted!{
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
        }
        else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
        }
        

        favorites.text = "\(tweets.favoritesCount)"
        retweets.text = "\(tweets.retweetCount)"
    }
    
    @IBAction func retweet(_ sender: Any) {     //|||NOT DONE WITH THESE....COME BACK 
        
    }
    
    @IBAction func like(_ sender: Any) {
        
    }
    
   
}
