

import UIKit

class UserPageViewController: UIViewController,UITabBarDelegate, UITableViewDataSource {
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
                self.userInfo = user                                    //||||||||||||||||||||||||||||||||||||||||||||||||||||
                self.tweetsCount.text = "\(user.followersCount)"        //|||[SETS HEADER PROPERTIES ACCORDING TO USERNAME]|||
                self.header.setImageWith(user.bannerUrl!)               //||||||||||||||||||||||||||||||||||||||||||||||||||||
                
            }, failure: { (error) in })}
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        navItem()
        userScreenName = userScreenName != nil ? userScreenName : User.currentUser?.screenname
         
    }
    
    //|||[SETUP HEADER VIEW]|||
    
    private func setupHeader() {
        profileImage.setImageWith((tweets?.imgUrl)!)
        name.text = tweets?.username
        screenName.text = tweets?.handle
    }
    
    //|||[NAVITEM]|||
    private func navItem() {
        
        let titleView = UIImageView(image: #imageLiteral(resourceName: "TwitterLogoBlue"))
        titleView.frame = CGRect(x:0,y:0, width: 34, height: 34)
        titleView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleView
    }
    //||||||||||||||||||||||||
    //|||[CELL PROPERTIES]||||
    //||||||||||||||||||||||||||||||||||||||||||||
    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   //|||[RETURNS TWEETS ASSOCIATED WITH THAT USERNAME]|||
        return 0
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
