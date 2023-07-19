//
//  AreaCategory.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents the category of an area.

 The `AreaCategory` enumeration defines the possible categories of an area, such as a platform or concourse.

 Usage:
    let category = AreaCategory.platform

 - Note: This enumeration is used to categorize different areas within a train station.

 - SeeAlso: `TrackDirection`
 */
enum AreaCategory {
    /// The area category represents a platform.
    case platform
    
    /// The area category represents a concourse.
    case concourse
}
