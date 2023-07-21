//
//  GetNavigationUseCase.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

protocol GetNavigationUseCase {
    func execute(accessibility: AccessibilityCategory?) -> Navigation?
}

class DefaultGetNavigationUseCase: GetNavigationUseCase {
    
    private var repository: StationRepository
    
    init(repository: StationRepository) {
        self.repository = repository
    }
    
    func execute(accessibility: AccessibilityCategory? = nil) -> Navigation? {
        return nil
    }
    
}
