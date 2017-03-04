
import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reply", style: .plain, target: self, action: #selector(reply))
    }

    func reply() {}
   
}
