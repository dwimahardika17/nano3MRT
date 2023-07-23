//
//  Accessibility.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents the accessibility category.
 
 The `Accessibility` enumeration defines the possible categories for accessibility options. It provides options for different types of accessible features and transportation modes. This enumeration can be extended with additional options depending on specific requirements.

 Usage:
    let category = Accessibility.<accessibilityOption>

 - Note: This enumeration is used to categorize and identify different accessibility options available for various locations and routes. It is commonly used in conjunction with location-related data to indicate the level of accessibility at a specific point of interest or along a given route.

 - Important: When adding new cases to this enumeration, make sure to use descriptive and self-explanatory names that accurately represent the accessibility category.

 - SeeAlso: `Placemark`
 */
enum Accessibility: String, CaseIterable {
    /// Indicates pedestrian accessibility, suitable for walking or foot traffic.
    case pedestrian
    
    /// Indicates the presence of tactile blocks for guiding visually impaired individuals.
    case tactileBlocks
    
    /// Indicates wheelchair accessibility, suitable for individuals using wheelchairs or mobility aids.
    case wheelchair
    
    /// Indicates bicycle accessibility, suitable for cyclists or bicycle riders.
    case bicycle
    
    /// Indicates the availability of folding bicycle accommodation.
    case foldingBicycle
}
