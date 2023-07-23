//
//  MapManager.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation

/**
 The `MapManager` protocol defines methods and properties that a map manager should implement.
 It provides functionality for searching locations and opening directions in a map application.
 */
protocol MapManager: AnyObject {
    /**
     Searches for locations based on the provided query and optional region.
     
     - Parameters:
       - query: The search query for locations.
       - region: An optional coordinate representing the region to limit the search results. If `nil`, the search will cover a broad area.
       - completion: A closure to be executed once the search is complete. It contains an array of `Placemark` objects representing the search results.
     */
    func searchForLocation(_ query: String, region: Coordinate?, completion: @escaping (_ placemarks: [Placemark]) -> Void)
    
    /**
     Opens the map application with directions to the specified coordinate.
     
     - Parameters:
       - coordinate: The coordinate to open directions for.
       - mode: The mode of transportation for directions (walk or driving).
     */
    func openDirectionInMap(coordinate: Coordinate, mode: DirectionMode)
}
