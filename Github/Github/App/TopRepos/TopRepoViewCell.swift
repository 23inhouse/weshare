//
//  TopRepoViewCell.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

class TopRepoViewCell: UITableViewCell {
  let mainStack: UIStackView = {
    let mainStack = UIStackView()
    mainStack.axis = .vertical
    return mainStack
  }()

  let detailStack: UIStackView = {
    let detailStack = UIStackView()
    detailStack.axis = .horizontal
    detailStack.distribution = .equalSpacing
    return detailStack
  }()

  var name: UILabel = {
    let name = UILabel()
    name.font = UIFont.preferredFont(forTextStyle: .headline)
    return name
  }()

  var desc: UILabel = {
    let desc = UILabel()
    desc.font = UIFont.preferredFont(forTextStyle: .subheadline)
    return desc
  }()

  var language: UILabel = {
    let language = UILabel()
    language.font = UIFont.preferredFont(forTextStyle: .body)
    return language
  }()

  var starCount: UILabel = {
    let starcount = UILabel()
    starcount.font = UIFont.preferredFont(forTextStyle: .body)
    return starcount
  }()

  var forkCount: UILabel = {
    let forkCount = UILabel()
    forkCount.font = UIFont.preferredFont(forTextStyle: .body)
    return forkCount
  }()

  var author: UILabel = {
    let author = UILabel()
    author.font = UIFont.preferredFont(forTextStyle: .body)
    return author
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupView()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension TopRepoViewCell {
  func setupConstraints() {
    mainStack.constrain(to: self, margin: 10)
  }

  func setupView() {
    addSubview(mainStack)
    mainStack.addArrangedSubview(name)
    mainStack.addArrangedSubview(desc)
    mainStack.addArrangedSubview(detailStack)

    detailStack.addArrangedSubview(language)
    detailStack.addArrangedSubview(starCount)
    detailStack.addArrangedSubview(forkCount)
    detailStack.addArrangedSubview(author)
  }
}
