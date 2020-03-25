//
//  SetTimeViewModel.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 24/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

protocol SetTimeViewModelProtocol {

    func onSetTimeButtonTap(values: [String])
}

class SetTimeViewModel {

    // MARK: - Aliases
    typealias Interactor = TimerInteractorProtocol

    // MARK: - Properties
    private let interactor: Interactor
    
    init(interactor: Interactor) {
        self.interactor = interactor
    }
}

extension SetTimeViewModel: SetTimeViewModelProtocol {

    func onSetTimeButtonTap(values: [String]) {
        print("Got values \(values)")
    }
}
