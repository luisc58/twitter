

import UIKit

class UserPageViewController: UIViewController {
    //[[[[HEADER VIEW]]]]]
    @IBOutlet weak var profileImage: corners!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var tweetsCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    
    //||||Tweets from HomeViewController,passed data from indexpath||||
    var tweets : Tweet?
    var userInfo : User!
    
   //||||[CURRENT USER]|||||
    
    var userScreenName : String? {
        didSet 
        {
            User.userWithScreenName(tweets!.handle, success: { (user) in
                self.userInfo = user
                self.tweetsCount.text = "\(user.followersCount)"
                self.header.setImageWith(user.bannerUrl!)
                print("\(user.name)")
            }, failure: { (error) in })}
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        userScreenName = userScreenName != nil ? userScreenName : User.currentUser?.screenname
         
    }
    
    //|||[SETUP HEADER VIEW]|||
    
    private func setupHeader() {
        profileImage.setImageWith((tweets?.imgUrl)!)
        name.text = tweets?.username
        screenName.text = tweets?.handle
        
        
    }
    
    
}
