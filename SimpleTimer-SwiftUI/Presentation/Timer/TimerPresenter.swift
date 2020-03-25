//
//  TimerPresenter.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import RxSwift

protocol TimerPresenterProtocol {

    func onToggleTimerButtonTap()
    func toggleTimer()
    func runTimer()
    func stopTimer()
}

class TimerPresenter {

    // MARK: - Aliases
    typealias Interactor = TimerInteractorProtocol

    // MARK: - Propeties
    var viewModel = TimerViewModel()

    var remainingTime: Date = Date().addingTimeInterval(60)
    var timerIsRunning: Bool = false
    var timerDisposable: Disposable?

    private let interactor: Interactor
    
    // MARK: - Init
    init(interactor: Interactor) {
        self.interactor = interactor
    }
    
    deinit {
        timerDisposable?.dispose()
    }
}

extension TimerPresenter: TimerPresenterProtocol {

    func onToggleTimerButtonTap() {
        timerIsRunning = !timerIsRunning
        viewModel.startStopButtonTitle = timerIsRunning ? "STOP": "START"
        toggleTimer()
    }

    func toggleTimer() {
        timerIsRunning ? runTimer() : stopTimer()
    }

    func runTimer() {
        remainingTime = Date().addingTimeInterval(60)
        timerDisposable = Observable<Int>
            .interval(0.1, scheduler: MainScheduler.asyncInstance)
            .map { _ in self.remainingTime.timeIntervalSince(Date()) }
            .map { "\(Int($0))" }
            .distinctUntilChanged()
            .subscribe(onNext: { self.viewModel.seconds = $0 })
    }

    func stopTimer() {
        timerDisposable?.dispose()
    }
}
