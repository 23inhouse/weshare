//
//  Api.swift
//  Github
//
//  Created by Benjamin Lewis on 19/12/19.
//  Copyright © 2019 Benjamin Lewis. All rights reserved.
//

import Foundation

struct API {
  static func fetchItems(from urlPath: String, completion: @escaping ([GitHubRawItem]) -> Void) {
    guard let url = URL(string: urlPath) else {
      print("Error: Invalid url path")
      return
    }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data, error == nil else {
        print(error?.localizedDescription ?? "Response Error")
        return
      }

      guard let rawData = GitHubRawData.decode(from: data) else {
        print("Error: Couldn't decode data")
        return
      }

      DispatchQueue.main.async {
        completion(rawData.items)
      }
    }

    task.resume()
  }
}
