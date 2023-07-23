//
//  GetNearestStationToUserUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetNearestStationToUserUseCase {
    func execute(completion: @escaping (_ station: Station?, _ entranceGate: Placemark?) -> Void)
}

class DefaultGetNearestStationToUserUseCase: GetNearestStationToUserUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository = DefaultStationRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (_ station: Station?, _ entranceGate: Placemark?) -> Void) {
        
    }
    
}

