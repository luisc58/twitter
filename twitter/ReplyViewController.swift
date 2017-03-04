//
//  ReplyViewController.swift
//  twitter
//
//  Created by luis castillo on 3/3/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    @IBAction func tweetPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didCancel(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
