//
//  Debouncer.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 21/07/23.
//

import Foundation

class Debouncer {
    let delay: Double
    var timer: Timer?

    init(delay: Double) {
        self.delay = delay
    }

    func debounce(task: @escaping (() -> Void)) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            task()
        }
    }
}
