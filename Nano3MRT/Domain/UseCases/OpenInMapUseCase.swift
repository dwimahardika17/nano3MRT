//
//  OpenMapUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

protocol OpenInMapUseCase {
    func execute(coordinate: Coordinate, mode: DirectionMode)
}

class DefaultOpenMapUseCase: OpenInMapUseCase {
    
    private var repository: LocationRepository
    
    init(repository: LocationRepository = DefaultLocationRepository()) {
        self.repository = repository
    }
    
    func execute(coordinate: Coordinate, mode: DirectionMode = .walk) {
        repository.openInMap(coordinate: coordinate, mode: mode)
    }
}
