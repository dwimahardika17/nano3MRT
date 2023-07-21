//
//  GateType.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents the type of a gate.

 The `GateType` enumeration defines the possible types of a gate, which can be either an entrance or an exit.

 Usage:
    let type = GateType.entrance

 - Note: This enumeration is used to indicate the type of a gate.

 - SeeAlso: `AccessibilityCategory`
 */
enum GateType: String {
    /// The gate type represents an entrance.
    case entrance
    
    /// The gate type represents an exit.
    case exit
}
