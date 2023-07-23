//
//  LocationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 The `LocationRepository` protocol defines methods to interact with location services and placemark information.
 It provides functionality to update the device's location, retrieve placemark details based on coordinates,
 search for placemarks using keywords, and open the map application with directions to a specific coordinate.
 */
protocol LocationRepository {
    /**
     Updates the device's current location asynchronously.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the location update is complete.
                             It contains the updated coordinate of the device if available, or `nil` if the location update failed or was denied by the user.
     */
    func updateDeviceLocation(completion: @escaping (Coordinate?) -> Void)

    /**
     Retrieves the placemark information based on the given coordinate asynchronously.

     - Parameter coordinate: The coordinate for which to retrieve the placemark details.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the retrieval is complete.
                             It contains the placemark information associated with the given coordinate, or `nil` if the retrieval failed or no placemark was found for the coordinate.
     */
    func getPlacemark(in coordinate: Coordinate, cache: Bool, completion: @escaping (Placemark?) -> Void)

    /**
     Searches for placemarks based on the provided keyword asynchronously.

     - Parameter keyword: The search keyword for placemarks.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an array of `Placemark` objects representing the search results.
     */
    func searchPlacemark(for keyword: String, cache: Bool, completion: @escaping ([Placemark]) -> Void)

    /**
     Opens the map application with directions to the specified coordinate.

     - Parameter coordinate: The coordinate to open directions for.
     - Parameter mode: The mode of transportation for directions (walking or driving).
     */
    func openInMap(coordinate: Coordinate, mode: DirectionMode)
}

