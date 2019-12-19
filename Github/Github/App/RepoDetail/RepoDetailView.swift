//
//  RepoDetailView.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import UIKit

class RepoDetailView: UIView {
  let mainStack: UIStackView = {
    let mainStack = UIStackView()
    mainStack.axis = .vertical
    mainStack.spacing = 5
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

  var desc: UITextView = {
    let desc = UITextView()
    desc.font = UIFont.preferredFont(forTextStyle: .body)
    return desc
  }()

  var language: UILabel = {
    let language = UILabel()
    language.font = UIFont.preferredFont(forTextStyle: .subheadline)
    return language
  }()

  var starCount: UILabel = {
    let starcount = UILabel()
    starcount.font = UIFont.preferredFont(forTextStyle: .subheadline)
    return starcount
  }()

  var forkCount: UILabel = {
    let forkCount = UILabel()
    forkCount.font = UIFont.preferredFont(forTextStyle: .subheadline)
    return forkCount
  }()

  var author: UILabel = {
    let author = UILabel()
    author.font = UIFont.preferredFont(forTextStyle: .subheadline)
    return author
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension RepoDetailView {
  func setupConstraints() {
    mainStack.constrain(to: self, margin: 10)
  }

  func setupView() {
    backgroundColor = .white
    addSubview(mainStack)
    mainStack.addArrangedSubview(name)
    mainStack.addArrangedSubview(language)
    mainStack.addArrangedSubview(author)
    mainStack.addArrangedSubview(detailStack)
    mainStack.addArrangedSubview(desc)

    detailStack.addArrangedSubview(forkCount)
    detailStack.addArrangedSubview(starCount)
  }
}
