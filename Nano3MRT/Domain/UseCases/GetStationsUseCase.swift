//
//  GetStationsUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetStationsUseCase {
    func execute(completion: @escaping ([Station]) -> Void)
}

class DefaultGetStationsUseCase: GetStationsUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository = DefaultStationRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping ([Station]) -> Void) {
        repository.getStations(cache: true, completion: completion)
    }
    
}
