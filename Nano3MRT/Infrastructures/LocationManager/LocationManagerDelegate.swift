//
//  LocationManagerDelegate.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import CoreLocation

/**
 A delegate protocol for receiving location service updates.

 The `LocationManagerDelegate` protocol defines methods that a delegate can implement to receive updates related to location services, such as changes in authorization status and new location updates.

 Usage:
    class MyClass: LocationManagerDelegate {
        let locationService = LocationManager()
        
        init() {
            locationService.delegate = self
        }

        // Implement the delegate methods
        func didChangeAuthorization(_ status: CLAuthorizationStatus) {
            // Handle authorization status changes
        }

        func didUpdateLocations(_ locations: [CLLocation]) {
            // Handle location updates
        }
    }

 - Note: The `LocationManagerDelegate` protocol relies on the CoreLocation framework.

 - SeeAlso: `LocationManager`
 */
protocol LocationManagerDelegate: AnyObject {
    /**
     Notifies the delegate that the authorization status has changed.

     - Parameter status: The new authorization status.
     */
    func didChangeAuthorization(_ status: CLAuthorizationStatus)
    
    /**
     Notifies the delegate that new location updates are available.

     - Parameter locations: An array of `CLLocation` objects representing the new locations.
     */
    func didUpdateLocations(_ locations: [CLLocation])
}
