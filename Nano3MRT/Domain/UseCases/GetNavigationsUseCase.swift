//
//  GetNavigationsUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetNavigationsUseCase {
    func execute(from departure: Station, entranceGate: Placemark?, to destination: Station, exitGate: Placemark?, accessibility: Accessibility?, completion: @escaping ([Navigation]) -> Void)
}

class DefaultGetNavigationUseCase: GetNavigationsUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository = DefaultStationRepository()) {
        self.repository = repository
    }
    
    func execute(from departure: Station, entranceGate: Placemark?, to destination: Station, exitGate: Placemark?, accessibility: Accessibility?, completion: @escaping ([Navigation]) -> Void) {
        
        repository.getNavigations(accessibility: accessibility, cache: true) { result in
            guard !result.isEmpty else {
                completion([])
                return
            }
            
            /*
             1. define route
             2. get all navigations
             3. filter by departure and destination
             4.
             */
            
            var firstStationNavigations = [Navigation]()
            if let entranceGate {
                firstStationNavigations = result.filter { $0.gateway == entranceGate }
            } else {
                firstStationNavigations = result.filter { $0.station.id == departure.id }
            }
            
            var lastStationNavigations = [Navigation]()
            if let exitGate {
                lastStationNavigations = result.filter { $0.gateway == exitGate }
            } else {
                lastStationNavigations = result.filter { $0.station.id == destination.id }
            }
        }
    }
}
