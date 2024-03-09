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

        UIStackView(arrangedSubviews: [openWindowButton])
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
    }
}
