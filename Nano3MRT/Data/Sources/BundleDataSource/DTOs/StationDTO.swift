//
//  StationDTO.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

struct StationDTO: Codable {
    let id: UUID
    let name: String
    let address: String
    let coordinate: CoordinateDTO
    
    func toDomain() -> Station {
        .init(id: id,
              name: name,
              address: address,
              coordinate: coordinate.toDomain())
    }
}

extension StationDTO {
    struct CoordinateDTO: Codable {
        let longitude: Double
        let latitude: Double
        
        func toDomain() -> Coordinate {
            .init(latitude: latitude,
                  longitude: longitude)
        }
    }
}
