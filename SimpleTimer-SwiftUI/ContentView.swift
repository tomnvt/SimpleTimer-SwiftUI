//
//  ContentView.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(self.viewModel.hours)
                Text(":")
                Text(self.viewModel.minutes)
                Text(":")
                Text(self.viewModel.seconds)
            }
            Spacer()
            Button(action: {
                self.viewModel.onToggleTimerButtonTap()
            }) {
                Text(viewModel.startStopButtonTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var hours: String = "01"
    @Published var minutes: String = "00"
    @Published var seconds: String = "00"

    @Published var startStopButtonTitle: String = "Start"

    var timerIsRunning = false

    func onToggleTimerButtonTap() {
        timerIsRunning = !timerIsRunning
        startStopButtonTitle = timerIsRunning ?
            "Stop": "Start"
        hours = "00"
    }
}
