//
//  HomeViewController.swift
//  twitter
//
//  Created by luis castillo on 2/24/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        TwitterClient.sharedInstance?.homeTimeline(success: { ( tweets : [Tweet]) in
        self.tweets = tweets
        self.tableView.reloadData()
        
            
        }, failure: { (error) in })   
    }
    
    
    @IBAction func logOut(_ sender: Any) { TwitterClient.sharedInstance?.logout() }
    
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets?.count ?? 0
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let tweet = tweets?[indexPath.row]
        cell.userTweet.text = tweet?.text
        cell.userImage.setImageWith((tweet?.imgUrl)!)
        cell.name.text = tweet?.username
        cell.handle.text = tweet?.handle
        cell.favNumber.text = "\(tweet!.favoritesCount)"
        cell.retNumber.text = "\(tweet!.retweetCount)"
        
    return cell
    }
    
    }
