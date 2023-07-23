//
//  DefaultLocationManager.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import CoreLocation
import Combine

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
    
    /// The current user's location coordinate.
    var coordinate: Coordinate?
    
    /// A boolean value indicating whether location updates are enabled.
    private var enabled: Bool = false
    
    /// The CLLocationManager instance responsible for managing location updates.
    private let manager: CLLocationManager
    
    private var isUpdatingLocation: Bool = false
    
    private var coordinateContinuation: CheckedContinuation<Coordinate, Error>?
    
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
        requestAuthorization()
        manager.delegate = self
    }
    
    /**
     Updates the device's current location asynchronously.
     
     - Parameter completion: A closure to be executed once the location update is complete.
     It contains the updated coordinate of the device if available, or `nil` if the location update failed or was denied by the user.
     */
    func updateDeviceLocation(completion: @escaping (Coordinate?) -> Void) {
        Task {
            let result = try? await withCheckedThrowingContinuation({ continuation in
                coordinateContinuation = continuation
                startUpdate()
            })
            completion(result)
        }
    }
    
    /**
     Retrieves the placemark information based on the given coordinate asynchronously.
     
     - Parameter currentCoordinate: The coordinate for which to retrieve the placemark details.
     If `nil`, the method will use the latest updated coordinate.
     - Parameter completion: A closure to be executed once the retrieval is complete.
     It contains the placemark information associated with the given coordinate, or `nil` if the retrieval failed or no placemark was found for the coordinate.
     */
    func getPlacemark(in coordinate: Coordinate, completion: @escaping (Placemark?) -> Void ) {
        let location = Helpers.createCLLocation(from: coordinate)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if error == nil, let placemarks = placemarks, let firstLocation = placemarks.first {
                let currentPlacemark = Helpers.createPlacemark(from: firstLocation)
                completion(currentPlacemark)
            } else {
                completion(nil)
            }
        }
    }
    
    /**
     Requests the user's authorization for location services.
     It enables background location updates.
     */
    private func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    /**
     Starts updating the user's location.
     */
    private func startUpdate() {
        guard !isUpdatingLocation else { return }
        isUpdatingLocation = true
        manager.startUpdatingLocation()
    }
    
    /**
     Stops updating the user's location.
     */
    private func stopUpdate() {
        isUpdatingLocation = false
        manager.stopUpdatingLocation()
    }
}

extension DefaultLocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        enabled = manager.authorizationStatus == .authorizedAlways
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let newCoordinate = Helpers.createCoordinate(from: location.coordinate)
            coordinate = newCoordinate
            if isUpdatingLocation {
                coordinateContinuation?.resume(returning: newCoordinate)
                stopUpdate()
            }
        }
    }
}
