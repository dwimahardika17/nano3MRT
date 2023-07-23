//
//  NavigationViewModel.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 21/07/23.
//

import SwiftUI
import MapKit

fileprivate let debouncer = Debouncer(delay: 1.0)

enum LoadingMaterial {
    case userLocation
    case navigation
    case departure
    case destination
}

enum NavigationViewModelStatus: Equatable {
    case onAppear
    case idle
    case isLoading(LoadingMaterial)
    case results(LoadingMaterial)
    case noResult(LoadingMaterial)
    case error(String)
}

class NavigationViewModel: ObservableObject {
    // Get current location
    @Published private(set) var currentLocation: Coordinate?
    
    // Get search results
    @Published private(set) var departureResults: [Placemark] = []
    @Published private(set) var destinationResults: [Placemark] = []
    
    // Get selected placemarks
    @Published private(set) var departurePlacemark: Placemark?
    @Published private(set) var destinationPlacemark: Placemark?
    
    // Get view model status
    @Published private(set) var status: NavigationViewModelStatus = .idle
    
    // MARK: - Use cases
    private let getUserLocationUseCase: GetUserLocationUseCase
    private let searchDepartureLocationUseCase: SearchDepartureLocationUseCase
    private let searchDestinationLocationUseCase: SearchDestinationLocationUseCase
    private let getNavigationUseCase: GetNavigationsUseCase
    private let getStationsUseCase: GetStationsUseCase
    
    init() {
        getUserLocationUseCase = DefaultGetUserLocationUseCase()
        searchDepartureLocationUseCase = DefaultDepartureSearchLocationUseCase()
        searchDestinationLocationUseCase = DefaultDestinationSearchLocationUseCase()
        getNavigationUseCase = DefaultGetNavigationUseCase()
        getStationsUseCase = DefaultGetStationsUseCase()
        
        updateUserLocation()
    }
    
    func onAppear() {
        status = .onAppear
        getStationsUseCase.execute { stations in
            print(stations.count)
        }
    }
    
    func onSelectDepartureResult(_ selected: Placemark) {
        departurePlacemark = selected
        getNavigation()
    }
    
    func onSelectDestinationResult(_ selected: Placemark) {
        destinationPlacemark = selected
        getNavigation()
    }
    
    func updateUserLocation() {
        status = .isLoading(.userLocation)
        getUserLocationUseCase.execute { [weak self] coordinate, placemark in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.currentLocation = coordinate
                self.departurePlacemark = placemark
                self.status = .idle
            }
        }
    }
    
    func searchDeparture(query: String) {
        guard status != .onAppear else {
            status = .idle
            return
        }
        
        guard status != .isLoading(.navigation) else { return }
        
        debouncer.debounce { [weak self] in
            guard let self else { return }
            self.status = .isLoading(.departure)
            
            searchDepartureLocationUseCase.execute(for: query) { [weak self] placemarks in
                guard let self else { return }
                DispatchQueue.main.async {
                    self.departureResults = placemarks
                    self.status = placemarks.isEmpty && !query.isEmpty ? .noResult(.departure) : .results(.departure)
                }
            }
        }
    }
    
    func searchDestination(query: String) {
        guard status != .onAppear else {
            status = .idle
            return
        }
        
        guard status != .isLoading(.navigation) else { return }
        
        debouncer.debounce { [weak self] in
            guard let self else { return }
            self.status = .isLoading(.destination)
            searchDestinationLocationUseCase.execute(for: query) { [weak self] placemarks in
                guard let self else { return }
                
                DispatchQueue.main.async {
                    self.destinationResults = placemarks
                    self.status = placemarks.isEmpty && !query.isEmpty ? .noResult(.destination) : .results(.destination)
                }
            }
        }
    }
    
    func getNavigation() {
        guard let departurePlacemark, let destinationPlacemark else { return }
        status = .isLoading(.navigation)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else { return }
            // TODO: Should change status.
            self.status = .idle
        }
    }
}

// MARK: Private methods
extension NavigationViewModel {
    private func valid(_ query: String) -> Bool {
        query.count > 1
    }
}
