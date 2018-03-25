//
//  TrackViewController.swift
//  Showcase
//
//  Created by Mikhail Shadrin on 03.10.2017.
//  Copyright © 2017 Mikhail Shadrin. All rights reserved.
//

import UIKit
import CoreLocation

class TrackViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    @IBOutlet weak var locationText: UITextView!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBAction func changeToggle(_ sender: Any) {
        if toggleSwitch.isOn {
            if (CLLocationManager.locationServicesEnabled() == false) {
                self.toggleSwitch.isOn = false
            }
            
            if locationManager == nil {
                locationManager = CLLocationManager()
                locationManager.delegate = self
                locationManager.distanceFilter = 10.0
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.requestWhenInUseAuthorization()
                
                locationManager.startUpdatingLocation()
            }
        }
        else {
            if locationManager != nil {
                locationManager.stopUpdatingLocation()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationText.layer.cornerRadius = 5.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.endIndex-1] as CLLocation
        self.locationText.text = location.description
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationText.text = "failed with error \(error.localizedDescription) "
    }
    
}

