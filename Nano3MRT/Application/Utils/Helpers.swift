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
    
    static func createCoordinateFromCL(_ clCoordinate: CLLocationCoordinate2D) -> Coordinate {
        Coordinate(latitude: clCoordinate.latitude, longitude: clCoordinate.longitude)
    }
    
    static func address(_ placemark: MKPlacemark) -> String {
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
