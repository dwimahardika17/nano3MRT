//
//  PlacemarkCategory.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 The `PlacemarkCategory` enumeration defines different categories for locations or points of interest on the map.

 The `PlacemarkCategory` enumeration allows you to categorize and distinguish different types of locations or points of interest based on their physical function or purpose. Each case in the enumeration represents a specific category and is associated with a raw string value.

 Usage:
    let category = PlacemarkCategory.trainStop

 - Note: This enumeration is used to classify locations or points of interest and can be applied to instances of the `Placemark` struct to identify their specific category.

 - Important: When using the `PlacemarkCategory` enumeration, ensure that each case is used accurately to represent the corresponding physical function or type of location. For example, you can use `.trainStop` for train stations or `.pointOfInterest` for notable places.

 - SeeAlso: `Placemark`, `Navigation`
 */
enum PlacemarkCategory: String {
    /// Represents a gateway or entrance location.
    case gateway
    
    /// Represents a train stop or station location.
    case trainStop
    
    /// Represents a location or step within an indoor environment.
    case indoorStep
    
    /// Represents a point of interest or notable location on the map.
    case pointOfInterest
}
