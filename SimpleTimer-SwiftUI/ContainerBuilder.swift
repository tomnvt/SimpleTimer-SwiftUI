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
        registerRemainingTimeInteractor(to: container)
        registerInputConverter(to: container)
        return container
    }

    // TODO: Separate by layers
    static func registerTimerModele(to container: Container) {
        container.register(TimerView.self) { r in
            let presenter = r.resolve(TimerPresenter.self)!
            return TimerView(presenter: presenter)
        }

        container.register(TimerPresenter.self) { r in
            let interactor = r.resolve(TimerInteractorProtocol.self)!
            return TimerPresenter(interactor: interactor)
        }
    }

    static func registerSetTimeModule(to container: Container) {
        container.register(SetTimeView.self) { r in
            let viewModel = r.resolve(SetTimeViewModel.self)!
            return SetTimeView(viewModel: viewModel)
        }

        container.register(SetTimeViewModel.self) { r in
            let interactor = r.resolve(TimerInteractorProtocol.self)!
            return SetTimeViewModel(interactor: interactor)
        }
    }

    static func registerRemainingTimeInteractor(to container: Container) {
        container.register(TimerInteractorProtocol.self) { r in
            TimerInteractor()
        }
    }

    static func registerInputConverter(to container: Container) {
        container.register(InputConverterProtocol.self) { r in
            InputConverter()
        }
    }
}
