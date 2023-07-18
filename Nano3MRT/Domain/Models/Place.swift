//
//  Place.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

struct Place {
    let identifier = UUID()
    let name: String
    let description: String?
    let coordinate: Coordinate
}

extension Place: Hashable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.name == rhs.name && lhs.coordinate == rhs.coordinate
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
}
