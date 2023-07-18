//
//  Point.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

struct Point {
    let name: String
    let accesibility: AccessibilityCategory
    let coordinate: Coordinate?
    let nearbyPlaces: [Place]
    let amenity: AmenityCategory?
    let imageUrls: [URL]
}
