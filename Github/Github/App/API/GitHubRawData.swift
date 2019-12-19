//
//  GitHubRawData.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import Foundation

struct GitHubRawData: Decodable {
  var items: [GitHubRawItem]
}

struct GitHubRawItem: Decodable {
  var name: String
  var fullName: String
  var owner: GitHubRawOwner
  var description: String
  var language: String?
  var stargazersCount: Int
  var forksCount: Int

  private enum CodingKeys: String, CodingKey {
    case name
    case fullName = "full_name"
    case owner
    case description
    case language
    case stargazersCount = "stargazers_count"
    case forksCount = "forks_count"
  }
}

struct GitHubRawOwner: Decodable {
  var login: String
  var avatarUrl: String

  private enum CodingKeys: String, CodingKey {
    case login
    case avatarUrl = "avatar_url"
  }
}

extension GitHubRawData {
  static func decode(from json: Data) -> GitHubRawData? {
    do {
      return try JSONDecoder().decode(GitHubRawData.self, from: json)
    } catch {
      print("""
        Error: Couldn't decode the JSON string
        \(error.localizedDescription)
        """)
    }

    return nil
  }
}
