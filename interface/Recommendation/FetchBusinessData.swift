//
//  FetchBusinessData.swift
//  YelpFusion
//
//

import Foundation


extension RecViewController {
    
    func retrieveVenues(latitude: Double,
                        longitude: Double,
                        category: String,
                        limit: Int,
                        sortBy: String,
                        locale: String,
                        completionHandler: @escaping ([Venue]?, Error?) -> Void) {
        
        
        // MARK: Retrieve venues from Yelp API
        let apikey = "53p-X_u_YHMgReunEEEzglT1-PfQih3AKmQmef5BKQKMe__oXhy56WK1SD3RvkfcvRLXAnJ8a3wttaK-DvG8TXac6qFtv10B4g28DH_MMNg3Z-JIjxuOdoNQtMI6YHYx"
        
        /// create URL
        let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude=\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale=\(locale)"
        
        let url = URL(string: baseURL)
        
        /// Creating request
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        /// Initialize session and task
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            do {
                
                /// Read data as JSON
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                
                /// Main dictionary
                guard let resp = json as? NSDictionary else { return }

                /// Businesses
                guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else { return }

                var venuesList: [Venue] = []
                
                /// Accessing each business
                for business in businesses {
                    var venue = Venue()
                    venue.name = business.value(forKey: "name") as? String
                    venue.id = business.value(forKey: "id") as? String
                    venue.rating = business.value(forKey: "rating") as? Float
                    venue.price = business.value(forKey: "price") as? String
                    venue.is_closed = business.value(forKey: "is_closed") as? Bool
                    venue.distance = business.value(forKey: "distance") as? Double
                    venue.latitude = business.value(forKey: "latitude") as? Float
                    venue.longitude = business.value(forKey: "longitude") as? Float
                    let address = business.value(forKeyPath: "location.display_address") as? [String]
                    venue.address = address?.joined(separator: "\n")
                    
                    venuesList.append(venue)
                }
                
                completionHandler(venuesList, nil)
                
            } catch {
                print("Caught error")
                completionHandler(nil, error)
            }
            }.resume()
        
        
    }
}


