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
    let recentResult = topRepos[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TopRepoViewCell
    cell.name.text = "Best swift repo"
    cell.desc.text = "It does wow and I can't even, and even if i could I just couldn't. you know?!"
    cell.language.text = "Swift"
    cell.starCount.text = "⭐️ \(recentResult)"
    cell.forkCount.text = "🍴 \(recentResult)"
    cell.author.text = "by: SwiftBro"
    return cell
  }
}
