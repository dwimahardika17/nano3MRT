//
//  LocationServices.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import CoreLocation

/**
 Manages location services and provides updates to the delegate.

 The `LocationService` class is responsible for managing location services and delivering location updates to the delegate. It provides methods for requesting authorization, starting and stopping location updates, and stores the current location.

 Usage:
    let locationService = LocationService()
    locationService.delegate = self
    locationService.requestAuthorization()
    locationService.start()

 - Note: The `LocationService` class relies on the CoreLocation framework.

 - SeeAlso: `LocationServiceDelegate`
 */
class LocationService: NSObject {
    /// The delegate for receiving location service updates.
    weak var delegate: LocationServiceDelegate?
    
    /// The current location.
    var location: CLLocation?
    
    /// Indicates whether location services are enabled.
    var enabled: Bool = false
    
    /// The underlying `CLLocationManager` used for location updates.
    private let manager: CLLocationManager
    
    /**
     Initializes a new instance of `LocationService`.

     - Parameter locationManager: The `CLLocationManager` to use. By default, a new instance is created.
     */
    init(locationManager: CLLocationManager = CLLocationManager()) {
        manager = locationManager
        manager.desiredAccuracy = kCLLocationAccuracyBest
        super.init()
        manager.delegate = self
    }
    
    /**
     Requests authorization to use location services.
     */
    func requestAuthorization() {
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
    }
    
    /**
     Starts updating the location.
     */
    func start() {
        manager.startUpdatingLocation()
    }
    
    /**
     Stops updating the location.
     */
    func stop() {
        manager.stopUpdatingLocation()
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        enabled = manager.authorizationStatus == .authorizedAlways
        delegate?.didChangeAuthorization(manager.authorizationStatus)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.didUpdateLocations(locations)
    }
}
