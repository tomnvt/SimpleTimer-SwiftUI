//
//  TimerView.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

struct TimerView: View {

    @ObservedObject var viewModel: TimerViewModel
    var presenter: TimerPresenter

    init(presenter: TimerPresenter) {
        self.presenter = presenter
        self.viewModel = presenter.viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                timer
                Spacer()
                buttons
                Spacer()
            }
        }
    }

    var timer: some View {
        HStack {
            TimerText(value: self.presenter.viewModel.hours)
            ColumnText()
            TimerText(value: self.presenter.viewModel.minutes)
            ColumnText()
            TimerText(value: self.presenter.viewModel.seconds)
        }
    }
    
    var buttons: some View {
        HStack {
            Spacer()
            startStopButton
            Spacer()
            setTimeNavigationLink
            Spacer()
        }
    }
    
    var startStopButton: some View {
        Button(action: {
            self.presenter.onToggleTimerButtonTap()
        }) {
            Text(self.presenter.viewModel.startStopButtonTitle)
        }
        .font(.largeTitle)
    }
    
    var setTimeNavigationLink: some View {
        NavigationLink(destination: SetTimeView()) {
            Text("SET").font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(presenter: TimerPresenter())
    }
}
