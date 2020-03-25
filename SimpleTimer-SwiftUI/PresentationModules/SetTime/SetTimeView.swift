//
//  SetTimeView.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 22/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import SwiftUI

struct SetTimeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var data: [(String, [String])] = [
        ("Hours", Array(0...24).map { "\($0)" }),
        ("Minutes", Array(0...60).map { "\($0)" }),
        ("Seconds", Array(0...60).map { "\($0)" })
    ]

    @State var selection = [0, 0, 0].map { "\($0)" }

    private let viewModel: SetTimeViewModel

    init(viewModel: SetTimeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            MultiPicker(data: data, selection: $selection).frame(height: 300)
            Button(action: {
                self.viewModel.onSetTimeButtonTap(values: self.selection)
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("SET")
            })
        }
    }
}
