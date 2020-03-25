//
//  TimerText.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 22/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

struct TimerText: View {
    
    var value: String

    var body: some View {
        Text(value).font(.system(size: 40, weight: .bold, design: .default))
    }
}
