//
//  SliderViewController.swift.swift
//  Showcase
//
//  Created by Mikhail Shadrin on 03.10.2017.
//  Copyright © 2017 Mikhail Shadrin. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController, UITextFieldDelegate {
    var redColor:CGFloat = 1.0
    var greenColor:CGFloat = 1.0
    var blueColor:CGFloat = 1.0
    
    @IBOutlet weak var redValue: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    @IBAction func redChange(_ sender: Any) {
        redColor = CGFloat(redSlider.value)
        redValue.text = String(format: "%.0f",Float(redColor*255.0))
        updateColor()
    }
    
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    @IBAction func greenChange(_ sender: Any) {
        greenColor = CGFloat(greenSlider.value)
        greenValue.text = String(format: "%.0f",Float(greenColor*255.0))
        updateColor()
    }
    
    @IBOutlet weak var blueValue: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBAction func blueChange(_ sender: Any) {
        blueColor = CGFloat(blueSlider.value)
        blueValue.text = String(format: "%.0f",Float(blueColor*255.0))
        updateColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redValue.delegate=self
        greenValue.delegate=self
        blueValue.delegate=self
        
        // Initialize text views
        redChange(redSlider)
        greenChange(greenSlider)
        blueChange(blueSlider)
        
        updateColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateColor(){
        self.view.backgroundColor =
            UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
    }
    
}

