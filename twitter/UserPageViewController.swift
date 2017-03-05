

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
    @IBOutlet weak var tableView: UITableView!
    
    //||||Tweets from HomeViewController,passed data from indexpath||||
    var tweets : Tweet?
    var tweet : [Tweet]?
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
        loadtweets()
    }
    
    override func viewWillAppear(_ animated: Bool) {     //||We want to load tweets right before view appears 
        loadtweets()
    }
    
    //|||[LOAD TWEETS]|||||
    
    func loadtweets() {
        TwitterClient.sharedInstance?.userTimeline(with: tweets!.handle, success: { (tweet) in
        self.tweet = tweet              /* Let tweet equal the tweet we get from calling the api  *TWITTER_CLIENT**/
        self.tableView.reloadData()
       }, failure: { (error) in })
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
        
        return tweet?.count ?? 0 
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TweetCellTableViewCell
        cell.tweet = tweet?[indexPath.row]      //||||INDEXES THOUGH ARRAY AND ASSIGNS IT TO tweet INSIDE TweetCellTableCell||||||||
        return cell
    }
    
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
