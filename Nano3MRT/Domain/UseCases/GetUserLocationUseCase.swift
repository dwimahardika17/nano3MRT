//
//  LocationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

protocol GetUserLocationUseCase {
    func execute(completion: @escaping (_ coordinate: Coordinate?, _ placemark: Placemark?) -> Void)
}

class DefaultGetUserLocationUseCase: GetUserLocationUseCase {
    
    private var repository: LocationRepository
    
    init(repository: LocationRepository = DefaultLocationRepository()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (_ coordinate: Coordinate?, _ placemark: Placemark?) -> Void) {
        repository.updateDeviceLocation { [weak self] coordinate in
            guard let self else { return }
            
            guard let coordinate else {
                completion(nil, nil)
                return
            }
            
            self.repository.getPlacemark(in: coordinate, cache: true) { placemark in
                completion(coordinate, placemark)
            }
        }
    }
}
