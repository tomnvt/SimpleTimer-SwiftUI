//
//  TimerInteractor.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 25/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import Foundation

protocol TimerInteractorProtocol {

    func setRemainingTime(values: [String])
    func getRemainingTime() -> Date
}

class TimerInteractor {}

extension TimerInteractor: TimerInteractorProtocol {

    func setRemainingTime(values: [String]) {
        print("I will remaining time according to values \(values)")
    }

    func getRemainingTime() -> Date {
        return Date().addingTimeInterval(60)
    }
}
