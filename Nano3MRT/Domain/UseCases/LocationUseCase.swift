//
//  LocationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

protocol LocationUseCase {
    func getCurrentUserLocation() -> Coordinate
    func getNearestStation(to location: Coordinate) -> Station?
    func getNavigation(from departure: Station, to destination: Station) -> Navigation
}
