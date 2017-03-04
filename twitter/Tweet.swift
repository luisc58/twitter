//
//  Tweet.swift
//  twitter
//
//  Created by luis castillo on 2/24/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text : String?
    var timestamp: Date?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var favorited : Bool?
    var retweeted : Bool?
    var retweetedStatus : Bool?
    var imgUrl : URL?
    var username : String?
    var tweetID: String?
    var handle  = "@"
   
    
    private var dateFormatter : DateFormatter = {
        let dFormatter = DateFormatter()
        dFormatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        
        return dFormatter
    }()
    
    
    init(dictionary: NSDictionary) {
        
        text = dictionary["text"] as? String
        favorited = dictionary["favorited"] as? Bool
        retweeted = dictionary["retweeted"] as? Bool
        tweetID = dictionary["id_str"] as? String
        username = dictionary.value(forKeyPath: "user.name") as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        handle += dictionary.value(forKeyPath: "user.screen_name") as! String
        if let timestampValue = dictionary["created_at"] as? String {
            timestamp = dateFormatter.date(from: timestampValue) 
        }
        
        if let profileImageURLString = dictionary.value(forKeyPath:"user.profile_image_url_https") as? String {
            imgUrl = URL(string: profileImageURLString)
        }
        
        

    }
    
    
    class func tweetsWithArray(dictionaries : [NSDictionary]) -> [Tweet] {
        
        var tweets = [Tweet]()
        dictionaries.forEach{ (dictionary) in tweets.append(Tweet(dictionary:dictionary)) }
        
        return tweets
    }
}
