//
//  Facility.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents the category of facility.

 The `Facility` enumeration defines the possible categories of an facility, such as a gate, train stop, stairs, elevator, lift, or ramp.

 Usage:
    let category = Facility.gate

 - Note: This enumeration is used to categorize different amenities or facilities within a train station.

 - SeeAlso: `DirectionIcon`
 */
enum Facility: String {
    /// The facility category represents stairs.
    case stairs
    
    /// The facility category represents an elevator.
    case elevator
    
    /// The facility category represents a lift.
    case lift
    
    /// The facility category represents a ramp.
    case ramp
    
    /// The facility category represents a walkway.
    case walkway
}
