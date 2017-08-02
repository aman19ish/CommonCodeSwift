//
//  GetCurrentLocation.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 02/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
import CoreLocation

enum LocationAuthorizedType {
    case Always
    case WhenInUse
}

class GetCurrentLocation: CLLocationManager {
    //MARK:- Public Variables
    var currentLocation: CLLocation?
    var authorizedType: LocationAuthorizedType = .WhenInUse  //Set according to imfo.Plist permision for location
    //MARK:- Private Variables
    fileprivate var sendLocation = {(_ location: CLLocation?) -> () in }
    
    static let sharedInstance = GetCurrentLocation()
    override init() {
    }
    
    func isLocationPermissionAuthorized() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            return true
        case .authorizedWhenInUse:
            return true
        case .denied:
            return false
        case .notDetermined:
            return false
        case .restricted:
            return false
        }
    }
    
    func getCurrentLocation(getLocation: @escaping (_ location: CLLocation?) -> ()) {
        currentLocation = nil
        self.delegate = self
        self.distanceFilter = kCLDistanceFilterNone
        self.desiredAccuracy = kCLLocationAccuracyBest
        if !isLocationPermissionAuthorized() {
            switch authorizedType {
            case .Always:
                requestAlwaysUsagePermission()
            case .WhenInUse:
                requestForUsagePermission()
            }
        }
        sendLocation = getLocation
    }
    
    func requestForUsagePermission() {
        if CLLocationManager.locationServicesEnabled() {
            if self.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) {
                self.requestWhenInUseAuthorization()
            }
        }
        self.startUpdatingLocation()
    }
    
    func requestAlwaysUsagePermission() {
        if CLLocationManager.locationServicesEnabled() {
            if self.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) {
                self.requestAlwaysAuthorization()
            }
        }
        self.startUpdatingLocation()
    }
}

//MARK:- CLLocation Manager Delegate Methods
extension GetCurrentLocation: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.stopUpdatingLocation()
        if locations.count > 0 && currentLocation == nil {
            currentLocation = locations.last
            sendLocation(locations.last)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }

}
