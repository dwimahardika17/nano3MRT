//
//  LocationServices.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import CoreLocation
import Combine

protocol LocationServiceDelegate: AnyObject {
    func didChangeAuthorization(_ status: CLAuthorizationStatus)
    func didUpdateLocations(_ locations: [CLLocation])
}

class LocationService: NSObject {
    weak var delegate: LocationServiceDelegate?
    
    var location: CLLocation?
    
    var enabled: Bool = false
    
    private let manager: CLLocationManager
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        manager = locationManager
        manager.desiredAccuracy = kCLLocationAccuracyBest
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorization() {
        manager.requestAlwaysAuthorization()
        manager.allowsBackgroundLocationUpdates = true
    }
    
    func start() {
        manager.startUpdatingLocation()
    }
    
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
