//
//  GateDTO.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

struct GateDTO: Codable {
    let id: UUID
    let stationId: String
    let trainRouteId: String?
    let name: String
    let altName: String?
    let annotationTitle: String?
    let annotationSubtitle: String?
    let annotationDescription: String?
    let category: String
    let navigationDirection: DirectionDTO
    let coordinate: CoordinateDTO
    let imageURLs: [String]
    let accessibilities: [String]
    let nearbyPlaces: [UUID]
    
    func toDomain(stationProvider: (_ stationId: UUID) -> Station?,
                  placesProvider: (_ placesId: [UUID]) -> [Placemark]) -> Placemark {
        let accessibilities = accessibilities.compactMap{ Accessibility(rawValue: $0) }
        let imageUrls = imageURLs.compactMap { URL(string: $0) }
        return .init(name: name,
                     altName: nil,
                     address: nil,
                     annotationTitle: name,
                     annotationSubtitle: nil,
                     annotationDescription: nil,
                     category: PlacemarkCategory(rawValue: category) ?? .gateway,
                     navigationDirection: navigationDirection.toDomain(),
                     coordinate: coordinate.toDomain(),
                     imageUrls: imageUrls,
                     station: stationProvider(id),
                     route: nil,
                     accessibilities: accessibilities,
                     nearbyPlaces: placesProvider(nearbyPlaces))
    }
}

extension GateDTO {
    struct CoordinateDTO: Codable {
        let latitude: Double
        let longitude: Double
        
        func toDomain() -> Coordinate {
            .init(latitude: latitude,
                  longitude: longitude)
        }
    }
    
    struct LocalizableStringDTO: Codable {
        let en: String?
        let id: String?
        
        func toDomain() -> LocalizableString {
            .init(en: en,
                  id: id)
        }
    }
    
    struct DirectionDTO: Codable {
        let entrance: AccessDirectionDTO
        let exit: AccessDirectionDTO
        
        func toDomain() -> Placemark.Direction {
            .init(entrance: entrance.toDomain(),
                  exit: exit.toDomain())
        }
    }
    
    struct AccessDirectionDTO: Codable {
        let iconURL: String
        let direction: LocalizableStringDTO
        let accessibilities: [String]
        let facilities: [String]
        
        func toDomain() -> AccessDirection {
            let accessibilities = accessibilities.compactMap{ Accessibility(rawValue: $0) }
            let facilities = facilities.compactMap { Facility(rawValue: $0) }
            return .init(icon: DirectionIcon(rawValue: iconURL) ?? .head,
                         direction: direction.toDomain(),
                         accessibilities: accessibilities,
                         facilities: facilities)
        }
    }
    
    struct PlacemarkDTO: Codable {
        
    }
}
