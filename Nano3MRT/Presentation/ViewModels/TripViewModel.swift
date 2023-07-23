//
//  TripViewModel.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 21/07/23.
//

import SwiftUI
import MapKit

@MainActor
class TripViewModel: ObservableObject {
    
    typealias MapManagerSearchResult = [MKLocalSearchCompletion]
    
    let debouncer = Debouncer(delay: 1.0)
    
    enum SearchType {
        case departure
        case destination
    }
    
    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching(SearchType)
        case error(String)
        case result
    }
    
    private let mapManager = DefaultMapManager<TripViewModel>()
    
    private let locationManager = DefaultLocationManager()
    
    @Published var departureQuery: String = ""
    @Published var destinationQuery: String = ""
    @Published private(set) var departureSearchResults: [MKMapItem] = []
    @Published private(set) var destinationSearchResults: [MKMapItem] = []
    @Published private(set) var status: LocationStatus = .idle
    
    @Published private(set) var currentUserLocation: CLLocation?
    @Published private(set) var currentDeparturePlacemark: CLPlacemark? {
        didSet {
            if let currentDeparturePlacemark {
                departureQuery = currentDeparturePlacemark.name ?? ""
            }
        }
    }
    @Published private(set) var currentDestinationPlacemark: CLPlacemark? {
        didSet {
            if let currentDestinationPlacemark {
                destinationQuery = currentDestinationPlacemark.name ?? ""
            }
        }
    }
    
    init() {
        mapManager.delegate = self
        locationManager.delegate = self
        startUpdateLocation()
    }
    
    public func search(for type: SearchType) {
        let query: String
        switch type {
        case .departure:
            if departureQuery.isEmpty {
                departureSearchResults = []
                return
            }
            query = departureQuery
        case .destination:
            if destinationQuery.isEmpty {
                destinationSearchResults = []
                return
            }
            query = destinationQuery
        }
        guard query.count > 3 else { return }
        
        debouncer.debounce { [weak self] in
            self?.status = .isSearching(type)
            self?.mapManager.searchForLocation(query, completion: { mapItems in
                self?.status = mapItems.isEmpty ? .noResults : .result
                switch type {
                case .departure:
                    self?.departureSearchResults = mapItems
                case .destination:
                    self?.destinationSearchResults = mapItems
                }
            })
        }
    }
    
    public func startUpdateLocation() {
        locationManager.startUpdate()
    }
    
    public func stopUpdateLocation() {
        locationManager.stopUpdate()
    }
}

extension TripViewModel: MapManagerDelegate {
    
    func didUpdateResults(searchResults: [MKLocalSearchCompletion]) {
        if status == .isSearching(.departure) {
//            departureSearchResults = searchResults
        }
        
        if status == .isSearching(.destination) {
//            destinationSearchResults = searchResults
        }
        
        status = searchResults.isEmpty ? .noResults : .result
    }
    
    func didFailWithError(_ error: Error) {
        status = .error(error.localizedDescription)
    }
    
}

extension TripViewModel: LocationManagerDelegate {
    
    func didChangeAuthorization(_ status: CLAuthorizationStatus) {
        
    }
    
    func didUpdateLocations(_ locations: [CLLocation]) {
        guard let location = locations.first else { return }
        currentUserLocation = location
        locationManager.lookUpCurrentLocation(location) { placemark in
            self.currentDeparturePlacemark = placemark
        }
        stopUpdateLocation()
    }
    
}
