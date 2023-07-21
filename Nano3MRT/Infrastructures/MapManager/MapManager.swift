//
//  MapManager.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation
import MapKit

/**
 The MapManager protocol defines methods and properties that a map manager should implement.
 It provides functionality for searching locations and opening directions in a map application.
 */
protocol MapManager: AnyObject {
    
    associatedtype T: MapManagerDelegate
    
    /// The delegate to receive map manager events.
    var delegate: T? { get set }
    
    /**
     Initiates a search based on the provided query.
     
     - Parameter query: The search query for locations.
     */
    func searchCompleter(for query: String)
    
    /**
     Opens the map application with directions to the specified coordinate.
     
     - Parameters:
     - coordinate: The coordinate to open directions for.
     - mode: The mode of transportation for directions (walk or driving).
     */
    func openDirectionInMap(coordinate: Coordinate, mode: DirectionMode)
}

/**
 The DefaultMapManager class is a concrete implementation of the MapManager protocol
 and provides the default behavior for searching locations and opening directions.
 */
class DefaultMapManager<T>: NSObject, MapManager, MKLocalSearchCompleterDelegate where T: MapManagerDelegate {
    
    /// The search completer used for location searches.
    private var searchCompleter: MKLocalSearchCompleter?
    
    /// The delegate to receive map manager events.
    weak var delegate: T?
    
    /**
     Initializes a DefaultMapManager instance with an optional MKLocalSearchCompleter.
     If not provided, a default completer will be used.
     
     - Parameter searchCompleter: The MKLocalSearchCompleter to use for location searches.
     (Default: MKLocalSearchCompleter())
     */
    init(searchCompleter: MKLocalSearchCompleter? = nil) {
        if let searchCompleter {
            self.searchCompleter = searchCompleter
        }
        super.init()
        self.searchCompleter?.delegate = self
    }
    
    /**
     Initiates a search based on the provided query.
     
     - Parameter query: The search query for locations.
     */
    func searchCompleter(for query: String) {
        self.searchCompleter?.queryFragment = query
    }
    
    /**
     Initiates a search based on the provided query.
     
     - Parameter query: The search query for locations.
     */
    func searchForLocation(_ query: String, region: MKCoordinateRegion? = nil, completion: @escaping (_ mapItems: [MKMapItem]) -> Void) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        if let region {
            request.region = region
        }
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            guard let response else {
                return
            }
            completion(response.mapItems)
        }
    }
    
    /**
     Opens the map application with directions to the specified coordinate.
     
     - Parameters:
     - coordinate: The coordinate to open directions for.
     - mode: The mode of transportation for directions (walk or driving).
     */
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
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        guard let completer = completer.results as? T.MapManagerSearchResult else { return }
        delegate?.didUpdateResults(searchResults: completer)
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        delegate?.didFailWithError(error)
    }
}

/**
 The DirectionMode enumeration represents the modes of transportation for directions.
 */
enum DirectionMode {
    /// Walk mode for directions.
    case walk
    /// Driving mode for directions.
    case driving
}
