//
//  SearchDepartureLocationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

protocol SearchDepartureLocationUseCase {
    func execute(for keyword: String, completion: @escaping ([Placemark]) -> Void)
}

class DefaultDepartureSearchLocationUseCase: SearchDepartureLocationUseCase {
    
    private var repository: LocationRepository
    
    init(repository: LocationRepository = DefaultLocationRepository()) {
        self.repository = repository
    }
    
    func execute(for keyword: String, completion: @escaping ([Placemark]) -> Void) {
        repository.searchPlacemark(for: keyword, cache: true, completion: completion)
    }
}