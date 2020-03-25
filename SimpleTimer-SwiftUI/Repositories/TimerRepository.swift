//
//  TimerRepository.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 26/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import Foundation

protocol TimerRepositoryProtocol {

    func setRemainingTime(_ date: Date)
    func getRemainingTime() -> Date
}

class TimerRepository: TimerRepositoryProtocol {

    var remainingTime: Date?

    func setRemainingTime(_ date: Date) {
        remainingTime = date
    }

    func getRemainingTime() -> Date {
        return remainingTime ?? Date()
    }
}
