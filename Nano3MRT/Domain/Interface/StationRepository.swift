//
//  StationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol StationRepository {
    func getAllStations() -> [Station]
    func getNearestStation(to coordinate: Coordinate) -> Station?
    func getNavigation(from departure: Station, to destination: Station, accessibility: AccessibilityCategory?) -> Navigation
}
