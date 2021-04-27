//
//  LocationViewController.swift
//  interface
//
//  Created by Kaleshia Lee on 4/27/21.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet var changeLocationBttn: UIView!
    
  //  @IBOutlet var locationDataLbl: UIView!
    @IBOutlet weak var locationDataLbl: UILabel!
    
    
    var locationManager:CLLocationManager!
      
      
      override func viewDidLoad() {
          super.viewDidLoad()
         changeLocationBttn.layer.cornerRadius = 10
          
          
          //instaantiate CLLocationManager
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
      
      extension LocationViewController: CLLocationManagerDelegate{
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

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


