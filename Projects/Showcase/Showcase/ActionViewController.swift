//
//  ActionViewController.swift
//  Showcase
//
//  Created by Mikhail Shadrin on 03.10.2017.
//  Copyright © 2017 Mikhail Shadrin. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    @IBOutlet weak var actionControl: UISegmentedControl!
    
    @IBOutlet weak var showmeButton: UIButton!
    @IBAction func performAction(_ sender: Any) {
        if actionControl.selectedSegmentIndex == 0 {
            let controller : UIAlertController = UIAlertController(title: "This is an alert", message: "You've created an alert view", preferredStyle: UIAlertControllerStyle.alert)
            let okAction : UIAlertAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,
                                                         handler: {
                                                            (alert: UIAlertAction!) in controller.dismiss(animated: true, completion: nil) })
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
        } else {
            let controller : UIAlertController = UIAlertController(title: "This is an action sheet",
                                                                   message: "You've created an action sheet",preferredStyle: UIAlertControllerStyle.actionSheet)
            let okAction : UIAlertAction = UIAlertAction(title: "Okay",
                                                         style: UIAlertActionStyle.default, handler: {
                                                            (alert: UIAlertAction!) in controller.dismiss(animated: true, completion: nil) })
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showmeButton.backgroundColor = UIColor(red: 9/255.0, green: 95/255.0, blue: 134/255.0, alpha: 1.0)
        showmeButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        showmeButton.layer.cornerRadius = 4.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
