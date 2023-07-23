//
//  Placemark.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

/**
 The `Placemark` struct represents a location or point on the map with associated details.
 
 The `Placemark` struct is used to store information about a specific location or point of interest on the map. It contains various properties that provide details about the location, such as its name, address, category, and geographical coordinates (latitude and longitude).
 
 This struct conforms to the `Identifiable` protocol, making each instance identifiable using a UUID. The unique identifier allows for easy reference and manipulation of individual placemark instances within collections and SwiftUI views.

 - Note: The `Placemark` struct is a fundamental building block for working with location-based data in the application. It is often used in conjunction with other components, such as `Navigation`, `MapManager`, and `StationRepository`, to provide comprehensive location-related features and functionalities.
 
 - Important: When creating a new instance of `Placemark`, ensure that it has a valid `id` and a descriptive `name`. The `category` property should be set to identify the physical function or type of location represented by the placemark (e.g., gateway, train stop, walkway). The `coordinate` property should contain valid geographical coordinates, specifying the latitude and longitude of the placemark's location.
 
 - SeeAlso: `PlacemarkCategory`, `Direction`, `Coordinate`, `Accessibility`
 */
struct Placemark: Identifiable {
    /// The unique identifier for the placemark.
    var id: UUID
    
    /// The name of the point.
    var name: String?
    
    /// An alternate name or alias for the point.
    var altName: String?
    
    /// The address of the point.
    var address: String?
    
    /// The title used for annotations on the map representing this placemark.
    var annotationTitle: String?
    
    /// The subtitle used for annotations on the map representing this placemark.
    var annotationSubtitle: String?
    
    /// A description associated with this placemark for annotations on the map.
    var annotationDescription: String?
    
    /// The category of this placemark, such as landmark, station, etc.
    var category: PlacemarkCategory
    
    /// The navigation direction information for this placemark, containing entrance and exit details. Related with `Navigation`.
    var navigationDirection: Direction?
    
    /// The geographical coordinates (latitude and longitude) of this placemark.
    var coordinate: Coordinate?
    
    /// The URLs of images associated with this placemark.
    var imageUrls: [URL]?
    
    /// The associated station (if any) that this placemark belongs to.
    var station: Station?
    
    /// The ID of the associated train route (if any) that this placemark is related to.
    var route: Route?
    
    /// The available accessibilities for this placemark, such as wheelchair accessibility, etc.
    var accessibilities: [Accessibility]
    
    /// A list of nearby places around this placemark.
    var nearbyPlaces: [Placemark]
    
    /**
     Initializes a new Placemark instance.
     
     - Parameters:
        - id: The unique identifier for the placemark. (Default: UUID())
        - name: The name of the point.
        - altName: An alternate name or alias for the point. (Default: nil)
        - address: The address of the point.
        - annotationTitle: The title used for annotations on the map representing this placemark.
        - annotationSubtitle: The subtitle used for annotations on the map representing this placemark.
        - annotationDescription: A description associated with this placemark for annotations on the map.
        - category: The category of this placemark, such as landmark, station, etc.
        - direction: The direction information for this placemark, containing entrance and exit details. (Default: nil)
        - coordinate: The geographical coordinates (latitude and longitude) of this placemark.
        - imageUrls: The URLs of images associated with this placemark. (Default: nil)
        - station: The ID of the associated station (if any) that this placemark belongs to. (Default: nil)
        - route: The associated route (if any) that this placemark belongs to. (Default: nil)
        - accessibilities: The available accessibilities for this placemark, such as wheelchair accessibility, etc.
        - nearbyPlaces: A list of nearby places around this placemark.
     */
    init(id: UUID = UUID(),
         name: String?,
         altName: String? = nil,
         address: String?,
         annotationTitle: String?,
         annotationSubtitle: String?,
         annotationDescription: String?,
         category: PlacemarkCategory,
         navigationDirection: Direction? = nil,
         coordinate: Coordinate?,
         imageUrls: [URL]? = nil,
         station: Station?,
         route: Route?,
         accessibilities: [Accessibility],
         nearbyPlaces: [Placemark]) {
        self.id = id
        self.name = name
        self.altName = altName
        self.address = address
        self.annotationTitle = annotationTitle
        self.annotationSubtitle = annotationSubtitle
        self.annotationDescription = annotationDescription
        self.category = category
        self.navigationDirection = navigationDirection
        self.coordinate = coordinate
        self.imageUrls = imageUrls
        self.station = station
        self.route = route
        self.accessibilities = accessibilities
        self.nearbyPlaces = nearbyPlaces
    }
}

/**
 The `Direction` struct represents the direction information for a placemark, containing entrance and exit details.
 
 This struct is used as part of the `Placemark` struct to provide direction details for the location.
 */
extension Placemark {
    struct Direction {
        /// The direction for the entrance of the placemark (if available).
        let entrance: AccessDirection?
        
        /// The direction for the exit of the placemark.
        let exit: AccessDirection
    }
}

/**
 The `Placemark` struct conforms to the `Hashable` protocol, enabling it to be used in sets and dictionaries.
 */
extension Placemark: Hashable {
    static func == (lhs: Placemark, rhs: Placemark) -> Bool {
        lhs.name == rhs.name && lhs.coordinate == rhs.coordinate
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
