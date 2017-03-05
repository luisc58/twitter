//
//  User.swift
//  twitter
//
//  Created by luis castillo on 2/22/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class User: NSObject {
    var name : String?
    var screenname: String?
    var profileURL: URL?
    var bannerUrl: URL?
    var tagline: String?
    var dictionary : NSDictionary?
    var followersCount : Int?
    var followingCount : Int?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as! String?
        screenname = dictionary["screen_name"] as! String?
        followersCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        let profileUrlString = dictionary["profile_image_url_https"] as! String?
        
        if let profileUrlString = profileUrlString {
            profileURL = URL(string: profileUrlString)!  
        }
        
        let banner = dictionary["profile_banner_url"] as! String?
        if let banner = banner {
            bannerUrl = URL(string: banner)
        }
        
        tagline = dictionary["description"] as! String?
    }
    
    static let userDidLogOut = NSNotification.Name(rawValue: "UserDidLogout")
    
    static var _currentUser : User?
    
    class func userWithScreenName(_ screeenName: String, success: @escaping ((User) -> ()), failure : @escaping (Error) -> ()) {
        TwitterClient.sharedInstance?.userWithSreenName(screeenName, success: success, failure: failure)
    }
    
    class var currentUser : User? {
    
        set {
            
            let user = newValue
            _currentUser = user 
            let defaults = UserDefaults.standard
            
            if user != nil {
                let data = try! JSONSerialization.data(withJSONObject: (user?.dictionary)!, options: [])
                defaults.setValue(data, forKey: "currentUser")
                
            } else {
                defaults.removeObject(forKey: "currentData")
            }
            
            defaults.synchronize()
            
        }
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.object(forKey: "currentUser") as? Data {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            
            return _currentUser
        }
    }
}

