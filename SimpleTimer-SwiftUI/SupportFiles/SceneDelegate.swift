//
//  SceneDelegate.swift
//  SimpleTimer-SwiftUI
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let timerView = container.resolve(TimerView.self)!

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: timerView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
