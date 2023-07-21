//
//  GetAllStationsUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetAllStationsUseCase {
    func execute() -> [Station]
}

class DefaultGetAllStationsUseCase: GetAllStationsUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository) {
        self.repository = repository
    }
    
    func execute() -> [Station] {
        return [Station]()
    }
    
}
