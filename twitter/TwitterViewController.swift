

import UIKit
import BDBOAuth1Manager
import SwiftKeychainWrapper

class TwitterViewController: UIViewController {
    var currentUser : String?
    override func viewDidLoad() {
    super.viewDidLoad()
}
        @IBAction func logInAction(_ sender: Any) {
         let client = TwitterClient.sharedInstance
     
        client?.login(success: { 
            self.performSegue(withIdentifier: "logIn", sender: nil)
            
            
                    
         }, failure: { (error : Error) in })
    }
      
    

    
}
