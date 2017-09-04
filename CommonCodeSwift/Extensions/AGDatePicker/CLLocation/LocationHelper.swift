//
//  LocationHelper.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 02/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
import MapKit

class LocationHelper: NSObject {
    // MARK: - Location helper methods
    func getLocationNameFrom(latitute: Double, longitude: Double, completion: @escaping (_ dicOfLocation: CLPlacemark)->()) {
        let ceo = CLGeocoder()
        let loc = CLLocation(latitude: latitute, longitude: longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler: {
            (placemarks,error) -> Void in
            let placemark = placemarks?[0]
            completion(placemark!)
        })
    }
    
    fileprivate func searchLocationByName(withText text: String, completion:@escaping (_ msg: String, _ location: CLLocation?) -> Void) {
        let localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = text
        
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start {(localSearchResponse: MKLocalSearchResponse?, error: Error?) -> Void in
            guard let searchResponse = localSearchResponse else {
                completion("Place Not Found", nil)
                return
            }
            var location = CLLocation()
            let latitude = searchResponse.boundingRegion.center.latitude
            let longitude = searchResponse.boundingRegion.center.longitude
            location = CLLocation(latitude: latitude,
                                  longitude: longitude)
            completion("Success", location)
        }
    }
    
}
