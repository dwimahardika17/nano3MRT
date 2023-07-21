//
//  MapManagerDelegate.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation
import MapKit

/**
 The MapManagerDelegate protocol defines methods that the map manager's delegate should implement to receive events.
 */
protocol MapManagerDelegate: AnyObject {
    
    associatedtype MapManagerSearchResult
    /**
     Informs the delegate that search results have been updated.
     
     - Parameter searchResults: The updated array of search results.
    */
    func didUpdateResults(searchResults: MapManagerSearchResult)

    /**
     Informs the delegate that an error occurred during the search process.
     
     - Parameter error: The error that occurred during the search process.
    */
    func didFailWithError(_ error: Error)
}
