//
//  InputConverter.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 26/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import Foundation

protocol InputConverterProtocol {

    func convert(_ input: [String]) -> Date
}

class InputConverter: InputConverterProtocol {

    func convert(_ input: [String]) -> Date {
        let hours = Int(input[0]) ?? 0
        let minutes = Int(input[1]) ?? 0
        let seconds = Int(input[2]) ?? 0
        let totalSeconds = TimeInterval(hours*3600 + minutes*60 + seconds)
        return Date().addingTimeInterval(totalSeconds)
    }
}
