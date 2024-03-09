//
//  ViewController.swift
//  MutipleWindowPractice
//
//  Created by Chiaote Ni on 2024/2/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        let openWindowButton = UIButton(type: .system)
        openWindowButton.setTitle("Open Window", for: .normal)
        openWindowButton.addTarget(self, action: #selector(openWindow), for: .touchUpInside)

        let model3DButtons = ModelType.allCases.map { modelType in
            let button = UIButton(type: .system)

            let title = modelType.title.components(separatedBy: " - ").first
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(openVolumeWindow), for: .touchUpInside)

            let userActivity = NSUserActivity(activityType: "com.Create3DModelWindow")
            userActivity.userInfo = ["ModelType": modelType.rawValue]
            button.userActivity = userActivity

            return button
        }

        UIStackView(arrangedSubviews: [openWindowButton] + model3DButtons)
            .set(\.axis, to: .vertical)
            .set(\.alignment, to: .center)
            .set(\.distribution, to: .equalSpacing)
            .set(\.translatesAutoresizingMaskIntoConstraints, to: false)
            // constraints
            .add(to: view)
            .anchor(\.topAnchor, to: view.topAnchor, constant: 30)
            .anchor(\.bottomAnchor, to: view.bottomAnchor, constant: -30)
            .anchor(\.leadingAnchor, to: view.leadingAnchor)
            .anchor(\.trailingAnchor, to: view.trailingAnchor)
    }

    @objc private func openWindow() {
        let request = UISceneSessionActivationRequest(
            role: .windowApplication,
            userActivity: NSUserActivity(activityType: "com.CreateNewSidePanel"),
            options: nil
        )
        UIApplication.shared.activateSceneSession(for: request) { error in
            assertionFailure("error: \(error)")
        }
    }

    @objc private func openVolumeWindow(_ sender: UIButton) {
    }
}
