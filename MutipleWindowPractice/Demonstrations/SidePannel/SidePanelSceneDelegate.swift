//
//  SidePanelSceneDelegate.swift
//  MutipleWindowPractice
//
//  Created by Chiaote Ni on 2024/2/16.
//

import UIKit

final class SidePanelSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let expectedSize = CGSize(width: 300, height: 300)
        scene.sizeRestrictions?.maximumSize = CGSize(width: 600, height: 300)
        scene.sizeRestrictions?.minimumSize = expectedSize

        let window = UIWindow(windowScene: scene)
        window.rootViewController = SidePanelViewController()
        window.windowLevel = .normal
        window.isHidden = false
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        print("🌲", #function)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("🌲", #function)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("🌲", #function)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("🌲", #function)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("🌲", #function)
    }

}
