//
//  GetNearestStationToDestinationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetNearestStationToDestinationUseCase {
    func execute(completion: @escaping (_ station: Station?, _ exitGate: Placemark?) -> Void)
}

class DefaultGetNearestStationToDestinationUseCase: GetNearestStationToDestinationUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository = DefaultStationRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (_ station: Station?, _ exitGate: Placemark?) -> Void) {
        
    }
    
}
