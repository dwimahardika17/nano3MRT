//
//  LocationRepository.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol LocationRepository {
    func getCurrentDeviceLocation() -> Coordinate
    func getLocation(for keyword: String) -> Coordinate
}
