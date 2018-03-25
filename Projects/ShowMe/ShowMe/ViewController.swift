//
//  ViewController.swift
//  ShowMe
//
//  Created by Mikhail Shadrin on 02.10.2017.
//  Copyright © 2017 Mikhail Shadrin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textToSendField: UITextField!
    
    @IBAction func showMe(_ sender: Any) {
        NSLog("User Wrote: %@", textToSendField.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let messageController = segue.destination as! MessageViewController
        messageController.messageData = textToSendField.text
    }
}

