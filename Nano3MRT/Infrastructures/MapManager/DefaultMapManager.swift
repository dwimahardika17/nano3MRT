//
//  MapManagerDelegate.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import MapKit

/**
 The `DefaultMapManager` class is a concrete implementation of the `MapManager` protocol
 and provides the default behavior for searching locations and opening directions.
 */
class DefaultMapManager: MapManager {
    func searchForLocation(_ query: String, region: Coordinate? = nil, completion: @escaping (_ placemarks: [Placemark]) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let region = region {
            request.region = Helpers.createCoordinateRegion(center: region)
        }
        let search = MKLocalSearch(request: request)
        
        search.start { response, error in
            guard let response = response else {
                // Handle error here and inform the completion handler
                completion([])
                return
            }
            let result = response.mapItems.map { Helpers.createPlacemark(from: $0.placemark) }
            completion(result)
        }
    }
    
    func openDirectionInMap(coordinate: Coordinate, mode: DirectionMode) {
        let directionMode: String
        switch mode {
        case .walk:
            directionMode = MKLaunchOptionsDirectionsModeWalking
        case .driving:
            directionMode = MKLaunchOptionsDirectionsModeDriving
        }
        
        let placemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
        let mapItem = MKMapItem(placemark: placemark)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: directionMode]
        mapItem.openInMaps(launchOptions: launchOptions)
    }
}
