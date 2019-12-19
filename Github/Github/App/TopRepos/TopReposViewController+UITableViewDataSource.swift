//
//  TopReposViewController+UITableViewDataSource.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

extension TopReposViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topRepos.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let repo = topRepos[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TopRepoViewCell
    cell.name.text = repo.name
    cell.desc.text = repo.description
    cell.language.text = repo.language ?? ""
    cell.starCount.text = "⭐️ \(repo.stargazersCount)"
    cell.forkCount.text = "🍴 \(repo.forksCount)"
    cell.author.text = "by: \(repo.owner.login)"
    return cell
  }
}
