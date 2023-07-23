//
//  LocationManager.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 The `LocationManager` protocol defines methods and properties that a location manager should implement.
 It provides functionality for obtaining and updating the user's location and reverse geocoding to get placemark information based on the current coordinate.
 
 - Note: `LocationManager` serves as an abstraction over Core Location services, allowing different implementations to handle location-related tasks.
 
 */
protocol LocationManager: AnyObject {
    
    /// The current user's location coordinate.
    var coordinate: Coordinate? { get }
    
    /**
     Updates the current user's location asynchronously.
     
     - Parameter completion: A closure to be executed once the location update is complete. It contains the updated user's coordinate if available, or `nil` if the location update failed or was denied by the user.
     */
    func updateDeviceLocation(completion: @escaping (Coordinate?) -> Void)
    
    /**
     Retrieves the placemark information based on the given coordinate asynchronously.
     
     - Parameter currentCoordinate: The coordinate for which to get the placemark information.
     - Parameter completion: A closure to be executed once the placemark retrieval is complete. It contains the placemark information associated with the given coordinate, or `nil` if the retrieval failed or no placemark was found for the coordinate.
     */
    func getPlacemark(in coordinate: Coordinate, completion: @escaping (Placemark?) -> Void)
    
}
