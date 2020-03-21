//
//  ContentViewModel.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var hours: String = "00"
    @Published var minutes: String = "00"
    @Published var seconds: String = "00"
    @Published var startStopButtonTitle: String = "Start"
}
