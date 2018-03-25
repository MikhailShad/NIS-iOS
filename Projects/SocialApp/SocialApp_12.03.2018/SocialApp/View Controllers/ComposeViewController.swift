//
//  ComposeViewController.swift
//  SocialApp
//
//  Created by Stas Zveryanov on 12.03.2018.
//  Copyright © 2018 MikhailShadrin. All rights reserved.
//

import UIKit
import Accounts
import Social

class ComposeViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var tweetContent: UITextView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var postActivity: UIActivityIndicatorView!
    
    var selectedAccount : ACAccount!
    
    @IBAction func dismissView(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func postToTwitter(_ sender: AnyObject) {
        postContent(post: self.tweetContent.text)}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tweetContent.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postContent(post : String){ postActivity.startAnimating()
        if let account = selectedAccount {
            let requestURL = URL(string: "https://api.twitter.com/1.1/statuses/update.json")
            if let request = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.POST, url: requestURL, parameters: NSDictionary(object: post, forKey: "status" as NSString) as [NSObject : AnyObject]) {
                request.account = account
                request.perform()
                    {
                        responseData, urlResponse, error in if(urlResponse?.statusCode == 200) {
                            print("Status Posted")
                            DispatchQueue.main.async {
                                self.postActivity.stopAnimating()
                                self.dismiss(animated: true, completion: nil) }
                        }
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
