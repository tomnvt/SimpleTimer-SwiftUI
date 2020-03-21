//
//  ContentView.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel
    var presenter: ContentViewPresenter

    init(presenter: ContentViewPresenter) {
        self.presenter = presenter
        self.viewModel = presenter.viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            timer
            Spacer()
            startStopButton
        }
    }

    var timer: some View {
        HStack {
            Text(self.presenter.viewModel.hours).font(.largeTitle)
            Text(":").font(.largeTitle)
            Text(self.presenter.viewModel.minutes).font(.largeTitle)
            Text(":").font(.largeTitle)
            Text(self.presenter.viewModel.seconds).font(.largeTitle)
        }
    }

    var startStopButton: some View {
        Button(action: {
            self.presenter.onToggleTimerButtonTap()
        }) {
            Text(self.presenter.viewModel.startStopButtonTitle)
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: ContentViewPresenter())
    }
}
