//
//  RouteDTO.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

struct RouteDTO: Codable {
    let id: UUID
    let name: String
    let stationIds: [UUID]
    
    func toDomain(provider: ((_ stationIds: [UUID]) -> [Station])?) -> Route {
        .init(id: id,
              name: name,
              stations: provider?(stationIds) ?? [])
    }
}
