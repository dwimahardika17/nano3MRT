//
//  DefaultLocationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation

class DefaultLocationRepository: LocationRepository {
    
    private var locationManager: LocationManager
    private var mapManager: MapManager
    
    init() {
        locationManager = DefaultLocationManager()
        mapManager = DefaultMapManager()
    }
    
    func updateDeviceLocation(completion: @escaping (Coordinate?) -> Void) {
        locationManager.updateDeviceLocation(completion: completion)
    }
    
    func getPlacemark(in coordinate: Coordinate, cache: Bool, completion: @escaping (Placemark?) -> Void) {
        locationManager.getPlacemark(in: coordinate, completion: completion)
    }
    
    func searchPlacemark(for keyword: String, cache: Bool, completion: @escaping ([Placemark]) -> Void) {
        mapManager.searchForLocation(keyword, region: nil, completion: completion)
    }
    
    func openInMap(coordinate: Coordinate, mode: DirectionMode) {
        mapManager.openDirectionInMap(coordinate: coordinate, mode: mode)
    }
    
}
