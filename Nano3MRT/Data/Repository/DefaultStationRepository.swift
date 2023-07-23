//
//  DefaultStationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation

class DefaultStationRepository: StationRepository {
    
    private var locationManager: LocationManager
    private var mapManager: MapManager
    
    private var bundleDataSource: BundleDataSource
    
    init() {
        locationManager = DefaultLocationManager()
        mapManager = DefaultMapManager()
        bundleDataSource = BundleDataSource()
    }
    
    func getStations(cache: Bool = true, completion: @escaping ([Station]) -> Void) {
        if !bundleDataSource.stations.isEmpty, cache {
            completion(bundleDataSource.stations)
            return
        }
        
        bundleDataSource.decodeStations { result in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(_):
                completion([])
            }
        }
    }
    
    func getRoutes(cache: Bool = true,
                   stationsProvider: ((_ stationIds: [UUID]) -> [Station])?,
                   completion: @escaping ([Route]) -> Void) {
        if !bundleDataSource.routes.isEmpty, cache {
            completion(bundleDataSource.routes)
            return
        }
        
        bundleDataSource.decodeRoutes(stationsProvider: stationsProvider) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(_):
                completion([])
            }
        }
    }
    
    func getGates(cache: Bool = true,
                  stationProvider: ((_ stationIds: UUID) -> Station)?,
                  placesProvider: ((_ placesId: [UUID]) -> [Placemark])?,
                  completion: @escaping ([Placemark]) -> Void) {
        if !bundleDataSource.gates.isEmpty, cache {
            completion(bundleDataSource.gates)
            return
        }
        
        bundleDataSource.decodeGates(stationProvider: stationProvider,
                                     placesProvider: placesProvider) { result in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(_):
                completion([])
            }
        }
    }
    
    func getNearestStation(to coordinate: Coordinate,
                           cache: Bool,
                           completion: @escaping (Station) -> Void) {
        
    }
    
    func getNavigations(accessibility: Accessibility?,
                        cache: Bool,
                        completion: @escaping ([Navigation]) -> Void) {
        bundleDataSource.decodeNavigations { result in
            switch result {
            case .success(let success):
                completion(success)
            case .failure(_):
                completion([])
            }
        }
    }
    
    func getNavigations(from departure: Station,
                        to destination: Station,
                        accessibility: Accessibility?,
                        cache: Bool,
                        completion: @escaping ([Navigation]) -> Void) {
        
    }
    
}
