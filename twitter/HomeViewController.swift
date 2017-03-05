
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerImage: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bannerImage: UIImageView!
    

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var subname: UILabel!
    
    var tweets: [Tweet]!
    var tweet : Tweet?
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
        sharedInstance()
        headerView()
        navItem()
    }
    
    private func sharedInstance() {
        TwitterClient.sharedInstance?.homeTimeline(success: { ( tweets : [Tweet]) in
            self.tweets = tweets
            self.tableView.reloadData()
            
        }, failure: { (error) in })   
    }
    
    private func headerView() {
        TwitterClient.sharedInstance?.currentAccount(success: { (user) in
            self.profileImage.setImageWith(user.profileURL!)
            self.bannerImage.setImageWith(user.bannerUrl!)
            self.username.text = "\(user.name!)"
            self.subname.text = "@\(user.screenname!)"
        }, failure: { (error) in
            
        })
    }
    
    private func navItem() {
        
        let titleView = UIImageView(image: #imageLiteral(resourceName: "TwitterLogoBlue"))
        titleView.frame = CGRect(x:0,y:0, width: 34, height: 34)
        titleView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleView
    }
    
    @IBAction func logOut(_ sender: Any) { TwitterClient.sharedInstance?.logout() }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   return tweets?.count ?? 0 }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let tweet = tweets[indexPath.row]
        cell.tweet = tweet
        cell.indexpath = indexPath
        cell.delegate = self
        
        cell.userTweet.text = tweet.text
        cell.userImage.setImageWith((tweet.imgUrl)!)
        cell.name.text = tweet.username
        cell.handle.text = tweet.handle
        
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {    tableView.deselectRow(at: indexPath, animated: true)    }
    
    
    func onFavorite(for cell:TableViewCell) {
        if cell.tweet.favorited == false {
            TwitterClient.sharedInstance?.favorite(tweetID: cell.tweet.tweetID!, success: { (tweet: Tweet) in
                self.tweets[(cell.indexpath?.row)!] = tweet
                self.tableView.reloadRows(at: [cell.indexpath!], with: .none)
                
            }, failure: { (error: Error) in
                print(error.localizedDescription)
            })
            
        } else{
            TwitterClient.sharedInstance?.unfavorite(tweetID: cell.tweet.tweetID!, success: { (tweet: Tweet) in
                self.tweets[(cell.indexpath?.row)!] = tweet
                self.tableView.reloadRows(at: [cell.indexpath!], with: .none)
                
                
            }, failure: { (error: Error) in
                print(error.localizedDescription)
            })
        }
        
    }
    
    func onRetweet(for cell: TableViewCell) {
        if cell.tweet.retweeted == false {
            TwitterClient.sharedInstance?.retweet(tweetID: cell.tweet.tweetID!, success: { (tweet: Tweet) in
                self.tweets[(cell.indexpath?.row)!] = tweet
                self.tableView.reloadRows(at: [cell.indexpath!], with: .none)
            }, failure: { (error: Error) in
                print(error.localizedDescription)
            })
        }
        else{
            TwitterClient.sharedInstance?.unretweet(tweetID: cell.tweet.tweetID!, success: { (tweet: Tweet) in
                self.tweets[(cell.indexpath?.row)!] = tweet
                self.tableView.reloadRows(at: [cell.indexpath!], with: .none)
                
            }, failure: { (error: Error) in
                print(error.localizedDescription)
            })
        }
    }
    
    
    var indexPath : NSIndexPath!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //[DIFFERENT SEGUES IN ONE VIEW CONTROLLER]]]]]
        if(segue.identifier == "detailView") {
         let cell = sender as! TableViewCell
         let indexPath = tableView.indexPath(for: cell)
         tweet = tweets[indexPath!.row]
         let detailedViewController = segue.destination as! TweetViewController
         detailedViewController.tweets = tweet
          
        }
        
        //[IN THIS CASE WE WANT TO ACCESS INDEXPATH.ROW THROUGH THE UIBUTTON]]]]]
        if(segue.identifier == "user") {
            if let button = sender as? UIButton {
                if let superview = button.superview {   //GET BUTTON'S SUPERVIEW
                    if let cell = superview.superview as? UITableViewCell {    
                        indexPath = tableView.indexPath(for: cell) as NSIndexPath!
                        tweet = tweets[indexPath.row]
                        print("\(indexPath.row)") //[TESTING!! OUTPUTS ROW NUMBER]
                        let userView = segue.destination as! UserPageViewController 
                        userView.tweets = tweet
                    } 
                }
            }
        }
    }
}




