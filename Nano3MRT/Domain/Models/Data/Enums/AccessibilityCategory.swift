//
//  AccessibilityCategory.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents the accessibility category.

 The `AccessibilityCategory` enumeration defines the possible categories for accessibility options. This enumeration can be extended with additional options depending on specific requirements.

 Usage:
    let category = AccessibilityCategory.<accessibilityOption>

 - Note: This enumeration is used to categorize different accessibility options.

 - SeeAlso: `GateType`
 */
enum AccessibilityCategory: String, Equatable {
    /// The accessibility for wheelchair.
    case wheelchair
    
    /// The accessibility for bicycle.
    case bicycle
}
