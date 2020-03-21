//
//  ContentViewPresenter.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import RxSwift

class ContentViewPresenter {

    var viewModel = ContentViewModel()

    var remainingTime: Date = Date()
    var timerIsRunning: Bool = false
    var timerDisposable: Disposable?

    func onToggleTimerButtonTap() {
        timerIsRunning = !timerIsRunning
        viewModel.startStopButtonTitle = timerIsRunning ? "Stop": "Start"
        toggleTimer()
    }

    func toggleTimer() {
        if timerIsRunning {
            timerDisposable = Observable<Int>
                .interval(0.1, scheduler: MainScheduler.asyncInstance)
                .subscribe(onNext: { number in
                    let time = self.remainingTime.timeIntervalSince(Date())
                    self.viewModel.seconds = "\(Int(time))"
                })
        } else {
            timerDisposable?.dispose()
            remainingTime = Date().addingTimeInterval(60)
        }
    }
}
