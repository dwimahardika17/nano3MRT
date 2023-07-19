//
//  Navigation.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents navigation between a gate and a train stop.

 The `Navigation` struct encapsulates the attributes and properties associated with navigation between a gate and a train stop within a train station. It represents the navigation route and sequence of steps involved in moving from a gate to a train stop.

 Usage:
    let navigation = Navigation(gate: gateA, trainStop: trainStopB, steps: [navigationPoint1, navigationPoint2])

 - Note: This struct provides information about the navigation route between a gate and a train stop.

 - Important: Each instance of `Navigation` should have a valid gate, train stop, and a sequence of navigation steps.

 - SeeAlso: `Gate`, `TrainStop`, `NavigationPoint`
 */
struct Navigation {
    /// The gate as the starting point of navigation or vice versa.
    var gate: Gate
    
    /// The train stop as the destination of navigation or vice versa.
    var trainStop: TrainStop
    
    /// The sequence of navigation steps between the gate and train stop.
    var steps: [NavigationPoint]
}
