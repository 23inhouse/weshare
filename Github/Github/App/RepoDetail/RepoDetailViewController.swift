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

  var repo: GitHubRawItem? {
    didSet {
      refreshView()
    }
  }

  let urlPath = "https://api.github.com/search/repositories?q=repo:"
  let initialRefreshDelay: Double = 1
  var refreshDelay: Double = 1

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    startRefreshLoop()
  }
}

private extension RepoDetailViewController {
  func fullPath() -> String? {
    guard let name = repo?.fullName else { return nil }
    return "\(urlPath)\(name)"
  }

  func language(for repo: GitHubRawItem) -> String {
    guard let lang = repo.language else {
      return ""
    }
    return "Language: \(lang)"
  }

  func refreshView() {
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

  func startRefreshLoop() {
    DispatchQueue.main.asyncAfter(deadline: .now() + refreshDelay) { [weak self] in
      guard let fullPath = self?.fullPath() else { return }

      let checkStatus: (Int) -> Void = { [weak self] code in
        if code == 200 {
          self?.refreshDelay = initialRefreshDelay
        } else {
          guard let delay = self?.refreshDelay else { return }
          self?.refreshDelay = delay * 2
        }

        self?.startRefreshLoop()
      }

      API.fetchItems(from: fullPath, checkStatus: checkStatus) { [weak self] items in
        guard let item = items.first else { return }
        self?.repo = item
      }
    }
  }
}
