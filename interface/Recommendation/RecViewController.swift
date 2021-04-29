//
//  RecViewController.swift
//  YelpFusion
//
//
//
//

import UIKit
import MapKit
import SwiftUI
import SCLAlertView

class RecViewController: UIViewController, UISearchBarDelegate {
    
   
    //Zoom to back Current Location Action
    @IBAction func zoomToUser(_ sender: Any) {
        mapView.setUserTrackingMode(.follow, animated: true)
    }

   // Info Button Action
   @IBAction func customAlert(_ sender: Any) {
        SCLAlertView().showInfo("Info", subTitle: "Use the search icon to find and pin locations.")
    }
    
  
    
    //Table View
    //@IBOutlet weak var venuesTableView: UITableView!
    @IBOutlet weak var venuesTableView: UITableView!
    
   
    //Map View
    @IBOutlet private var mapView: MKMapView!
    
    
    
    //Search field operates when the user click this button and it allows the user to search that place of interest
    @IBAction func searchButton(_ sender: Any) {
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    //This function will execute whenever the user presses the search
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        
        
        //Activity Indicator starts the process of using that search term to begin finding the location on the map
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        
        self.view.addSubview(activityIndicator)
        
        //Hide Search Bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Creating the search request
        //Takes users input and turns into a search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        //Starts a search on the specific text request
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        //Result of the active search were going to get two variables in return
        activeSearch.start { (response, Error) in
            
            activityIndicator.stopAnimating()
            
            if  response == nil
            {
                print("ERROR")
            }
            else
            {
                //Getting data latitude and longitdue of the location searchen
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                //Create annnotations
                let annotation = MKPointAnnotation()
                //Added Title
                annotation.title = searchBar.text
                //Set the coordinates for annotation
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                //Adds annonation to the map
                self.mapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }

    // U of H Coordinates
    let CPLatitude: Double = 29.721085
        let CPLongitude: Double =  -95.342049
    
    //Call Yelp database
    var venues: [Venue] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
        
        
        if mapView != nil{
        //zoomToUser
        mapView.showsUserLocation = true
        //mapView.centerToLocation(initialLocation)
        }
        let initialLocation  = CLLocation(latitude: 29.721085, longitude:  -95.342049)
        
        
        if mapView != nil{
        // Calling map of "current location"
        mapView.centerToLocation(initialLocation)
        
            
        
        //Create custom cell
        venuesTableView.delegate = self
        venuesTableView.dataSource = self
        venuesTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        venuesTableView.separatorStyle = .none
        
            
            
            retrieveVenues(latitude: CPLatitude, longitude: CPLongitude, category: "bbq",
                       limit: 20, sortBy: "distance", locale: "en_US") { (response, error) in
                        
                        if let response = response {
                            self.venues = response
                            DispatchQueue.main.async {
                                self.venuesTableView.reloadData()
                            }
                        }
        }
            
        }
    
    }
          
}
    

    // Current location set on map in the center
    private extension MKMapView {
      func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 3000
      ) {
        let coordinateRegion = MKCoordinateRegion(
          center: location.coordinate,
          latitudinalMeters: regionRadius,
          longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
      }
    }

// Set information into custom cell
    extension RecViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return venues.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            
            cell.nameLabel.text = venues[indexPath.row].name
            cell.ratingLabel.text = String(venues[indexPath.row].rating ?? 0.0)
            cell.priceLabel.text = venues[indexPath.row].price ?? "-"
            cell.isClosed = venues[indexPath.row].is_closed ?? false
            cell.addressLabel.text = venues[indexPath.row].address
            
            return cell
        }
    }




    


