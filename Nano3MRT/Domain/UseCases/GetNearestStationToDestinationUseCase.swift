//
//  GetNearestStationToDestinationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetNearestStationToDestinationUseCase {
    func execute() -> Station?
}

class DefaultGetNearestStationToDestinationUseCase: GetNearestStationToDestinationUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository) {
        self.repository = repository
    }
    
    func execute() -> Station? {
        return nil
    }
    
}
