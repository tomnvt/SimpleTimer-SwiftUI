//
//  ContainerBuilder.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 24/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import Swinject

let container = ContainerBuilder.buildContainer()

class ContainerBuilder {

    static func buildContainer() -> Container {
        let container = Container()
        registerTimerModele(to: container)
        registerSetTimeModule(to: container)
        return container
    }

    static func registerTimerModele(to container: Container) {
        container.register(TimerView.self) { r in
            let presenter = r.resolve(TimerPresenter.self)!
            return TimerView(presenter: presenter)
        }

        container.register(TimerPresenter.self) { _ in
            return TimerPresenter()
        }
    }

    static func registerSetTimeModule(to container: Container) {
        container.register(SetTimeView.self) { r in
            let viewModel = SetTimeViewModel()
            return SetTimeView(viewModel: viewModel)
        }
        
        container.register(SetTimeViewModel.self) { _ in
            return SetTimeViewModel()
        }
    }
}
