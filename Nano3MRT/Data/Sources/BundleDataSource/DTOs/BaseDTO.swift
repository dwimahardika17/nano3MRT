//
//  BaseDTO.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

struct BaseDTO<T: Codable>: Codable {
    let collectionType: String
    let collectionGroup: CollectionGroup?
    let features: [T]
}

extension BaseDTO {
    struct CollectionGroup: Codable {
        let key: String
        let value: UUID
        let details: String
    }
}
