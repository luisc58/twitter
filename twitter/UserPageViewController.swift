

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
    
    //[[[[CONNECTING TWEETS]]]]
    var tweets : Tweet?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
