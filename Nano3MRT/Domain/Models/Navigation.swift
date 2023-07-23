//
//  Navigation.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents navigation between a gate and a train stop in one station.
 
 The `Navigation` struct encapsulates the attributes and properties associated with navigation between a gate and a train stop within a train station. It provides information about the navigation route and sequence of steps involved in moving from a gate to a train stop.
 
 - Note: This struct is used to represent the navigation route between a gate and a train stop within a train station. It is commonly used in the context of providing directions or guiding users within a station environment.
 
 - Important: Each instance of `Navigation` should have a valid station's ID and a sequence of navigation steps, including the gate and train stop. The `steps` property should include the specific placemarks (e.g., entrances, platforms) that the user must follow to navigate from the gate to the train stop. The `accessibilities` property provides information about the accessibility options available along the navigation route.
 
 - SeeAlso: `Placemark`
 */
struct Navigation: Identifiable {
    /// The unique identifier for the navigation route.
    var id: UUID
    
    /// The station associated with this navigation route.
    var station: Station
    
    /// A description of the navigation route, providing additional information or context.
    var description: String?
    
    /// The sequence of navigation steps between the gate and train stop.
    var steps: [Placemark]
    
    /** The self assigned accessibility options. It is possible that each navigation step has different accessibilities,
     use `orderedAccessibilities` for accessibility available in all steps.
     */
    var accessibilities: [Accessibility]
    
    /// The placemark representing the gateway or entrance to the station, if available.
    var gateway: Placemark? {
        steps.first { $0.category == .gateway }
    }
    
    /// The placemark representing the train stop or platform, if available.
    var trainStop: Placemark? {
        steps.first { $0.category == .trainStop }
    }
    
    /// An array of accessibility options sorted in the order of availability along the navigation route.
    var orderedAccessibilities: [Accessibility] {
        var orderedAccessibilities = [Accessibility]()
        Accessibility.allCases.forEach { accessibility in
            orderedAccessibilities.append(accessibility)
            steps.forEach { step in
                if !step.accessibilities.contains(accessibility) {
                    orderedAccessibilities.removeAll { $0 == accessibility }
                }
            }
        }
        return orderedAccessibilities.uniqued()
    }
}
