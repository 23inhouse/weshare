//
//  TopReposViewController+UITableViewDelegate.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

extension TopReposViewController: UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    let repo = topRepos[indexPath.row]
    let repoDetailVC = RepoDetailViewController()
    repoDetailVC.repo = repo
    navigationController?.pushViewController(repoDetailVC, animated: true)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}
