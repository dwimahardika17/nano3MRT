//
//  BundleDataSource.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import Foundation

fileprivate let bundleExtension = "json"
fileprivate let stationsFileName = "stations"
fileprivate let routesFileName = "routes"
fileprivate let gatesFileName = "gates"
fileprivate let navigationsFileName = "navigations"

class BundleDataSource {
    
    static let shared = BundleDataSource()
    
    private let decoder: JSONDecoder
    
    var stations = [Station]()
    
    var routes = [Route]()
    
    var gates = [Placemark]()
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.decoder = decoder
        cacheData()
    }
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
        cacheData()
    }
    
    func cacheData() {
        decodeStations { [weak self] _ in
            self?.decodeRoutes(stationsProvider: nil) { _ in }
        }
    }
    
    func decodeStations(completion: @escaping (Result<[Station], Error>) -> Void) {
        do {
            guard let url = Bundle.main.url(forResource: stationsFileName, withExtension: bundleExtension) else {
                throw AppError.clientError(nil)
            }
            let data = try Data(contentsOf: url)
            let resultsDTO = try decoder.decode(BaseDTO<StationDTO>.self, from: data)
            let stations = resultsDTO.features.compactMap { $0.toDomain() }
            self.stations = stations
            completion(.success(stations))
        } catch {
            completion(.failure(error))
        }
    }
    
    func decodeRoutes(stationsProvider: ((_ stationIds: [UUID]) -> [Station])?, completion: @escaping (Result<[Route], Error>) -> Void) {
        do {
            guard let url = Bundle.main.url(forResource: routesFileName, withExtension: bundleExtension) else {
                throw AppError.clientError(nil)
            }
            let data = try Data(contentsOf: url)
            let resultsDTO = try decoder.decode(BaseDTO<RouteDTO>.self, from: data)
            
            let routes = resultsDTO.features.compactMap { $0.toDomain { [weak self] stationIds in
                guard let self else { return [] }
                
                if let stationsProvider {
                    return stationsProvider(stationIds)
                }
                
                if !self.stations.isEmpty {
                    return stationIds.compactMap { id in
                        self.stations.first { $0.id == id }
                    }
                }
                
                return []
            } }
            
            self.routes = routes
            completion(.success(routes))
        } catch {
            completion(.failure(error))
        }
    }
    
    func decodeGates(stationProvider: ((_ stationId: UUID) -> Station)?,
                     placesProvider: ((_ placeIds: [UUID]) -> [Placemark])?,
                     completion: @escaping (Result<[Placemark], Error>) -> Void) {
        do {
            guard let url = Bundle.main.url(forResource: gatesFileName, withExtension: bundleExtension) else {
                throw AppError.clientError(nil)
            }
            let data = try Data(contentsOf: url)
            let resultsDTO = try decoder.decode([BaseDTO<GateDTO>].self, from: data)
            
            let gatesDTO = resultsDTO.reduce([GateDTO]()) { $0 + $1.features }
            
            let gates = gatesDTO.compactMap { gateDTO in
                gateDTO.toDomain(stationProvider: { stationId in
                    if let stationProvider {
                        return stationProvider(stationId)
                    }
                    
                    if !stations.isEmpty {
                        return stations.first { $0.id == stationId }
                    }
                    
                    return nil
                }) { placeIds in
                    if let placesProvider {
                        return placesProvider(placeIds)
                    }
                    return []
                }
            }
            
            self.gates = gates
            completion(.success(gates))
        } catch {
            completion(.failure(error))
        }
    }
    
    func decodeNavigations(completion: @escaping (Result<[Navigation], Error>) -> Void) {
        
    }
}
