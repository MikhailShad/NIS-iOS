//
//  ViewController.swift
//  InTouch
//
//  Created by Mikhail Shadrin on 21.11.2017.
//  Copyright © 2017 Mikhail Shadrin. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendEmail(_ sender: AnyObject){
        if MFMailComposeViewController.canSendMail()
        {
            let mailVC = MFMailComposeViewController()
            mailVC.setSubject("Mail draft")
            mailVC.setToRecipients(["shadrin.michael@yandex.ru"])
            mailVC.setMessageBody("<p>Hello!</p>", isHTML: true)
            mailVC.mailComposeDelegate = self;
            self.present(mailVC, animated: true, completion: nil)
        } else {
            print("This device is currently unable to send email")
        }
    }
    
    @IBAction func sendText(_ sender: AnyObject){
        if MFMessageComposeViewController.canSendText() {
            let smsVC : MFMessageComposeViewController = MFMessageComposeViewController()
            smsVC.messageComposeDelegate = self
            smsVC.recipients = ["+79253089195"]
            smsVC.body = "Hello there! Would you like to talk about our Lord and Saviour?"
            self.present(smsVC, animated: true, completion: nil)
        } else {
            print("This device is currently unable to send text messages")
        }
    }
    
    @IBAction func openWebsite(_ sender: AnyObject){
        UIApplication.shared.open(URL(string: "http://instagram.com/mikhailshad/")!, options: [:], completionHandler: nil)
    }
    
}

extension ViewController : MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result {
        case MessageComposeResult.sent:
            print("Result: Text Message Sent!")
        case MessageComposeResult.cancelled:
            print("Result: Text Message Cancelled.")
        case MessageComposeResult.failed:
            print("Result: Error, Unable to Send Text Message.")
        }
        
        self.dismiss(animated:true, completion: nil)
    }
}

extension ViewController : MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case MFMailComposeResult.sent:
            print("Result: Email Sent!")
        case MFMailComposeResult.cancelled:
            print("Result: Email Cancelled.")
        case MFMailComposeResult.failed:
            print("Result: Error, Unable to Send Email.")
        case MFMailComposeResult.saved:
            print("Result: Mail Saved as Draft.")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
