//
//  AppError.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import Foundation

enum AppError: Error, LocalizedError {
    case clientError(Error?)
    case clientErrorWithDescription(String)
    
    var errorDescription: String {
        switch self {
        case .clientError(let err):
            return NSLocalizedString(
                err != nil ? err?.localizedDescription ?? "Client error." : "Client error.",
                comment: "Failed to get data."
            )
        case .clientErrorWithDescription(let string):
            return string
        }
    }
}
