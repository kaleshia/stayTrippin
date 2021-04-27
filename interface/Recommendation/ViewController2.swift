//
//  ViewController2.swift
//  YelpFusion
//
//  Created by Shanice Smith on 3/7/21.
//  Copyright © 2021 pkh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController2: UIViewController {

    
    @IBOutlet weak var changeLocationBttn: UIView!
    
    
    @IBOutlet weak var locationDataLbl: UILabel!
    
    
    var locationManager:CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLocationBttn.layer.cornerRadius = 10
        
        
        //Instaantiate CLLocationManager
        locationManager = CLLocationManager()
        
        
        //Set the delegate of the location manager to the View Controller
        locationManager.delegate = self
        
    }
    
    
    @IBAction func changeLocationBttnTapped(_ sender: Any) {
        
        if CLLocationManager.locationServicesEnabled(){
            
            //Request when in use authorization status
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
    
    extension ViewController2: CLLocationManagerDelegate{
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
            
            switch CLLocationManager.authorizationStatus(){
            
            case .authorizedWhenInUse:
                locationManager.startUpdatingLocation()
                guard let currentLocation = locationManager.location else {return}
                
                locationDataLbl.text = "\(currentLocation.coordinate)"
                print("Location: \(currentLocation)")
                
            default:
                return
            }
        }
    }




