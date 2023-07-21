//
//  LocationManager.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import CoreLocation

/**
 The LocationManager protocol defines methods and properties that a location manager should implement.
 It provides functionality for starting and stopping location updates and has a delegate to receive location updates and authorization changes.
 */
protocol LocationManager: AnyObject {
    /// The delegate to receive location manager events.
    var delegate: LocationManagerDelegate? { get set }

    /// Starts updating the user's location.
    func startUpdate()

    /// Stops updating the user's location.
    func stopUpdate()
}

/**
 Manages location services and provides updates to the delegate.

 The `DefaultLocationManager` class is responsible for managing location services and delivering location updates to the delegate. It provides methods for requesting authorization, starting and stopping location updates, and stores the current location.

 Usage:
    let locationManager = LocationManager()
    locationManager.delegate = self
    locationManager.requestAuthorization()
    locationManager.start()

 - Note: The `DefaultLocationManager` class relies on the CoreLocation framework.

 - SeeAlso: `LocationManagerDelegate`
 */
class DefaultLocationManager: NSObject, LocationManager {

    /// The delegate to receive location manager events.
    weak var delegate: LocationManagerDelegate?

    /// The current user's location.
    var location: CLLocation?

    /// A boolean value indicating whether location updates are enabled.
    var enabled: Bool = false

    /// The CLLocationManager instance responsible for managing location updates.
    private let manager: CLLocationManager

    /**
     Initializes a DefaultLocationManager instance with an optional CLLocationManager.
     If not provided, a default instance will be used with best accuracy settings.
     
     - Parameter locationManager: The CLLocationManager to use for managing location updates.
                                  (Default: CLLocationManager())
    */
    init(locationManager: CLLocationManager = CLLocationManager()) {
        manager = locationManager
        manager.desiredAccuracy = kCLLocationAccuracyBest
        super.init()
        manager.delegate = self
    }

    /**
     Requests the user's authorization for location services.
     It enables background location updates.
    */
    private func requestAuthorization() {
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
    }

    /**
     Starts updating the user's location.
    */
    func startUpdate() {
        manager.startUpdatingLocation()
    }

    /**
     Stops updating the user's location.
    */
    func stopUpdate() {
        manager.stopUpdatingLocation()
    }
}

extension DefaultLocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        enabled = manager.authorizationStatus == .authorizedAlways
        delegate?.didChangeAuthorization(manager.authorizationStatus)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.didUpdateLocations(locations)
    }
}
