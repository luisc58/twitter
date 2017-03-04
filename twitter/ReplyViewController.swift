//
//  ReplyViewController.swift
//  twitter
//
//  Created by luis castillo on 3/3/17.
//  Copyright © 2017 luis castillo. All rights reserved.
//

import UIKit



class ReplyViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var replyText: UITextField!
    @IBOutlet weak var characterCount: UILabel!
    
    var tweet : Tweet?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
        
    }
    
    
    
    func setup() {
        characterCount.text = String(Tweet.length - replyText.text!.characters.count)
        replyText.delegate = self
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        replyText.becomeFirstResponder()
    }
    @IBAction func tweetPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func didCancel(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
