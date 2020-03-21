//
//  ContentViewPresenter.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

class ContentViewPresenter {

    var viewModel = ContentViewModel()

    var timerIsRunning: Bool = false

    func onToggleTimerButtonTap() {
        timerIsRunning = !timerIsRunning
        viewModel.startStopButtonTitle = timerIsRunning ? "Stop": "Start"
    }
}
