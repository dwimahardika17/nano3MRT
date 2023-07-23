//
//  StationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 The `StationRepository` protocol defines methods to interact with station data and provide navigation information.
 It provides functionality to retrieve a list of all stations, find the nearest station based on a given coordinate,
 and generate navigation details between two stations with optional accessibility considerations.
 */
protocol StationRepository {
    /**
     Retrieves a list of array of stations that representing all available stations.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an array of `Station` objects representing all available stations.
     */
    func getStations(cache: Bool, completion: @escaping ([Station]) -> Void)
    
    /**
     Retrieves a list of array of routes that representing all available routes.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter stationsProvider: A closure to provide stations data for results.
                             It receive an array of `UUID` objects representing all stations' id.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an array of `Route` objects representing all available routes.
     */
    func getRoutes(cache: Bool, stationsProvider: ((_ stationIds: [UUID]) -> [Station])?, completion: @escaping ([Route]) -> Void)

    /**
     Finds the nearest station to the given coordinate.

     - Parameter coordinate: The coordinate to which the nearest station should be found.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an `Station` object representing the nearest station to given coordinate.
     */
    func getNearestStation(to coordinate: Coordinate, cache: Bool, completion: @escaping (Station) -> Void)
    
    /**
     Generates all available navigations' details and if any filtered by accessibility.

     - Parameter accessibility: An optional parameter to consider accessibility requirements during navigation.
                                Pass `nil` to get standard navigation details without considering accessibility.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an array of `Navigation` object representing the all available navigations.
     */
    func getNavigations(accessibility: Accessibility?, cache: Bool, completion: @escaping ([Navigation]) -> Void)

    /**
     Generates all available navigations' details between two stations.

     - Parameter departure: The departure station for navigation.
     - Parameter destination: The destination station for navigation.
     - Parameter accessibility: An optional parameter to consider accessibility requirements during navigation.
                                Pass `nil` to get standard navigation details without considering accessibility.
     - Parameter cache: Indicates first cache data source. If sets true, it will retrieve data from cache memory if any as priority.
     - Parameter completion: A closure to be executed once the search is complete.
                             It contains an array of `Navigation` object representing the navigation recommendation details from departure to destination.
     */
    func getNavigations(from departure: Station, to destination: Station, accessibility: Accessibility?, cache: Bool, completion: @escaping ([Navigation]) -> Void)
}
