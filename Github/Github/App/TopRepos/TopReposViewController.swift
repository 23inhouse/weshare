//
//  TopReposViewController.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

class TopReposViewController: UIViewController {
  weak var coordinator: AppCoordinator?

  let cellIdentifier = "TopReposViewCell"

  private(set) var topReposTV = UITableView()
  private(set) var topRepos = [String]() {
    didSet {
      topReposTV.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadData()
  }
}

private extension TopReposViewController {
  func loadData() {
    topRepos = ["10000", "999", "123", "71", "23", "10", "1"]
  }

  func setupView() {
    title = "Trending Repos"
    view.addSubview(topReposTV)
    topReposTV.constrain(to: view)

    topReposTV.delegate = self
    topReposTV.dataSource = self
    topReposTV.register(TopRepoViewCell.self, forCellReuseIdentifier: cellIdentifier)
  }
}
