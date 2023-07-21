//
//  StartTripViewModel.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 21/07/23.
//

import SwiftUI
import MapKit

class StartTripViewModel: ObservableObject {
    
    typealias MapManagerSearchResult = [MKLocalSearchCompletion]
    
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
    
    private let mapManager = DefaultMapManager<StartTripViewModel>()
    
    @Published var departureQuery: String = ""
    @Published var destinationQuery: String = ""
    @Published private(set) var departureSearchResults: [MKLocalSearchCompletion] = []
    @Published private(set) var destinationSearchResults: [MKLocalSearchCompletion] = []
    @Published private(set) var status: LocationStatus = .idle
    
    
    init() {
        mapManager.delegate = self
    }
    
    public func search(_ query: String, for type: SearchType) {
        status = .isSearching(type)
        mapManager.searchCompleter(for: query)
    }
}

extension StartTripViewModel: MapManagerDelegate {
    
    func didUpdateResults(searchResults: [MKLocalSearchCompletion]) {
        if status == .isSearching(.departure) {
            departureSearchResults = searchResults
        }
        
        if status == .isSearching(.departure) {
            departureSearchResults = searchResults
        }
        
        status = searchResults.isEmpty ? .noResults : .result
    }
    
    func didFailWithError(_ error: Error) {
        status = .error(error.localizedDescription)
    }
    
}
