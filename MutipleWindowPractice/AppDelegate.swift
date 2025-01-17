//
//  AppDelegate.swift
//  MutipleWindowPractice
//
//  Created by Chiaote Ni on 2024/2/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        if let userActivity = options.userActivities.first {
            switch userActivity.activityType {
            case "com.CreateNewSidePanel":
                return UISceneConfiguration(
                    name: "SidePanel",
                    sessionRole: .windowApplication
                )
            case "com.CreateVolumeWindow":
                return UISceneConfiguration(
                    name: "Present3DModel",
                    sessionRole: .windowApplicationVolumetric
                )
            default:
                break
            }
        }
        return UISceneConfiguration(name: "Main", sessionRole: .windowApplication)
    }

    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        true
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

