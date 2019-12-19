//
//  MainViewController.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController {
  weak var coordinator: AppCoordinator?

  let topReposVC = TopReposViewController()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()

    pushViewController(topReposVC, animated: false)
  }
}

private extension MainViewController {
  func setupViews() {
    topReposVC.coordinator = coordinator

    navigationBar.prefersLargeTitles = false
//    navigationItem.largeTitleDisplayMode = .never
  }
}
