//
//  Model3DPresentingSceneDelegate.swift
//  MutipleWindowPractice
//
//  Created by Chiaote Ni on 2024/2/26.
//

import UIKit
import SwiftUI

final class Model3DPresentingSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard 
            let scene = (scene as? UIWindowScene),
            let userInfo = connectionOptions.userActivities.first?.userInfo,
            let modelTypeString = userInfo["ModelType"] as? String,
            let modelType = ModelType(rawValue: modelTypeString)
        else {
            return
        }
        let expectedSize = CGSize(width: 300, height: 300)
        scene.sizeRestrictions?.maximumSize = expectedSize
        scene.sizeRestrictions?.minimumSize = expectedSize

        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: Model3DPresentingView(modelType: modelType))
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
