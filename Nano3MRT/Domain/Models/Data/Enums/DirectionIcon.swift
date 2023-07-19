//
//  DirectionIcon.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents different types of direction icons or symbols.

 The `DirectionIcon` enumeration defines the possible types of direction icons or symbols used for navigation purposes, such as indicating the head direction, turn left, turn right, slight left, slight right, going upstairs, going downstairs, lift going up, lift going down, U-turn left, and U-turn right.

 Usage:
    let icon = DirectionIcon.head

 - Note: This enumeration is used to represent various types of direction icons or symbols.

 - SeeAlso: `AccessibilityCategory`
 */
enum DirectionIcon {
    /// The direction icon represents the head direction.
    case head
    
    /// The direction icon represents a left turn.
    case turnLeft
    
    /// The direction icon represents a right turn.
    case turnRight
    
    /// The direction icon represents a slight left turn.
    case slightLeft
    
    /// The direction icon represents a slight right turn.
    case slightRight
    
    /// The direction icon represents going upstairs.
    case toUpstairs
    
    /// The direction icon represents going downstairs.
    case toDownstairs
    
    /// The direction icon represents a lift going up.
    case liftUp
    
    /// The direction icon represents a lift going down.
    case liftDown
    
    /// The direction icon represents a U-turn to the left.
    case uTurnLeft
    
    /// The direction icon represents a U-turn to the right.
    case uTurnRight
}
