//
//  BundleDataSource.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation

class BundleDataSource {
    
    var stations: [Station] = []
    
    var navigations: [Navigation] = []
    
    var userLocation: Coordinate?
    
    var userDestination: Coordinate?
    
    var userNavigation: Navigation?
    
    init() {
        decodeStations()
        decodeNavigations()
    }
    
    func decodeStations() {
        
    }
    
    func decodeNavigations() {
        
    }
}
