//
//  Helpers.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation
import CoreLocation
import MapKit

struct Helpers {
    static func lineDistanceBetweenCoordinates(from coordinateA: Coordinate, to coordinateB: Coordinate) -> Distance {
        let earthRadius = 6371000.0 // Earth's radius in meters
        
        let dLat = (coordinateB.latitude - coordinateA.latitude).toRadians()
        let dLon = (coordinateB.longitude - coordinateA.longitude).toRadians()
        
        let a = sin(dLat/2) * sin(dLat/2) + cos(coordinateA.latitude.toRadians()) * cos(coordinateB.latitude.toRadians()) * sin(dLon/2) * sin(dLon/2)
        let c = 2 * atan2(sqrt(a), sqrt(1-a))
        
        let distance = earthRadius * c
        return distance
    }
    
    static func routeDistanceBetweenCoordinates(from coordinateA: Coordinate, to coordinateB: Coordinate) -> Distance? {
        return nil
    }
    
    static func createAuthorizationStatus(_ status: CLAuthorizationStatus) -> AuthorizationStatus {
        switch status {
        case .notDetermined:
            return .notDetermined
        case .restricted:
            return .restricted
        case .denied:
            return .denied
        case .authorizedAlways:
            return .always
        case .authorizedWhenInUse:
            return .whileInUse
        case .authorized:
            return .always
        @unknown default:
            return .notDetermined
        }
    }
    
    static func createCoordinate(from clCoordinate: CLLocationCoordinate2D) -> Coordinate {
        Coordinate(latitude: clCoordinate.latitude, longitude: clCoordinate.longitude)
    }
    
    static func createCoordinateRegion(center coordinate: Coordinate) -> MKCoordinateRegion {
        let center = Helpers.createCLLocationCoordinate(from: coordinate)
        let span = MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
        return MKCoordinateRegion(center: center, span: span)
    }
    
    static func createCLLocation(from coordinate: Coordinate) -> CLLocation {
        CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    static func createCLLocationCoordinate(from coordinate: Coordinate) -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    static func createMKCoordinateSpan(from coordinate: Coordinate) -> MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: coordinate.latitude, longitudeDelta: coordinate.longitude)
    }
    
    static func createPlacemark(from placemark: CLPlacemark) -> Placemark {
        let name = placemark.name
        var coordinate: Coordinate?
        if let clCoordinate = placemark.location?.coordinate {
            coordinate = Helpers.createCoordinate(from: clCoordinate)
        }
        let address = Helpers.createAddress(from: placemark)
        return .init(name: name, address: address, annotationTitle: name, annotationSubtitle: nil, annotationDescription: nil, category: .pointOfInterest, coordinate: coordinate, station: nil, route: nil,  accessibilities: [], nearbyPlaces: [])
    }
    
    static func createAddress(from placemark: CLPlacemark) -> String {
        var address: String = ""
        
        if let thoroughfare = placemark.thoroughfare {
            address += thoroughfare
            
            if let subThoroughfare = placemark.subThoroughfare {
                address += " " + subThoroughfare
                
                if let locality = placemark.locality {
                    address += ", " + locality
                }
            }
        } else if let locality = placemark.locality {
            address += locality
            
            if let country = placemark.country {
                address += ", " + country
            }
        } else if let country = placemark.country {
            address += country
        }
        return address
    }
}
