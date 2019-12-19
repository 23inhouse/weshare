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

  var repo: GitHubRawItem?

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
  func language(for repo: GitHubRawItem) -> String {
    guard let lang = repo.language else {
      return ""
    }
    return "Language: \(lang)"
  }
  func loadData() {
    guard let repo = repo else { return }

    repoDetailView.name.text = repo.name
    repoDetailView.desc.text = repo.description
    repoDetailView.language.text = language(for: repo)
    repoDetailView.starCount.text = "⭐️ \(repo.stargazersCount)"
    repoDetailView.forkCount.text = "🍴 \(repo.forksCount)"
    repoDetailView.author.text = "Author: \(repo.owner.login)"

  }

  func setupView() {
    view.addSubview(repoDetailView)
    guard let view = view else { return }
    repoDetailView.constrain(to: view.safeAreaLayoutGuide, margin: 0)
  }
}
