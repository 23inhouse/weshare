//
//  RepoDetailViewController.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
  weak var coordinator: AppCoordinator?

  let repoDetailView = RepoDetailView()

  private(set) var repo: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadData()
  }
}

private extension RepoDetailViewController {
  func loadData() {
    repo = "71"

    repoDetailView.name.text = "Best swift repo"
    repoDetailView.desc.text = "It does wow and I can't even, and even if i could I just couldn't. you know?!"
    repoDetailView.language.text = "Language: Swift"
    repoDetailView.starCount.text = "⭐️ \(repo)"
    repoDetailView.forkCount.text = "🍴 \(repo)"
    repoDetailView.author.text = "Author: SwiftBro"

  }

  func setupView() {
    view.addSubview(repoDetailView)
    repoDetailView.constrain(to: view, margin: 10)
  }
}
