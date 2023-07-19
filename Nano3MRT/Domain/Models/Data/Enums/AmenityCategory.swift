//
//  AmenityCategory.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents the category of an amenity or facility.

 The `AmenityCategory` enumeration defines the possible categories of an amenity or facility, such as a gate, train stop, stairs, elevator, lift, or ramp.

 Usage:
    let category = AmenityCategory.gate

 - Note: This enumeration is used to categorize different amenities or facilities within a train station.

 - SeeAlso: `DirectionIcon`
 */
enum AmenityCategory {
    /// The amenity category represents a gate.
    case gate
    
    /// The amenity category represents a train stop.
    case trainStop
    
    /// The amenity category represents stairs.
    case stairs
    
    /// The amenity category represents an elevator.
    case elevator
    
    /// The amenity category represents a lift.
    case lift
    
    /// The amenity category represents a ramp.
    case ramp
}
