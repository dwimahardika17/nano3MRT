//
//  LocationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

protocol GetUserLocationUseCase {
    func execute() -> Coordinate
}

class DefaultGetUserLocationUseCase: GetUserLocationUseCase {
    
    private var repository: LocationRepository
    
    init(repository: LocationRepository) {
        self.repository = repository
    }
    
    func execute() -> Coordinate {
        repository.getCurrentDeviceLocation()
    }
    
}
