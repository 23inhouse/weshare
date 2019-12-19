//
//  Api.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import Foundation

struct API {
  static func fetchData(completion: @escaping (GitHubRawData) -> Void) {
    guard let jsonPath = Bundle.main.path(forResource: "TopRepos", ofType: "json") else {
      print("ERROR: could find json file")
      return
    }

    let url = URL(fileURLWithPath: jsonPath)

    do {
      let data = try Data(contentsOf: url)
      guard let rawData = GitHubRawData.decode(from: data) else {
        print("Error: Couldn't decode data")
        return
      }

      completion(rawData)
    } catch {
      print("Error:", error.localizedDescription)
    }
  }
}
