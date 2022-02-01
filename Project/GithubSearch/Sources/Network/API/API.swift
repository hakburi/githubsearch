//
//  API.swift
//  GithubSearch
//
//  Created by SungHak Jung on 2021/12/30.
//

import Foundation

public protocol API {
  var url: URL { get }
  var route: Route { get }
  var targetRequest: URLRequest { get }
}

public extension API {
  var defaultURL: URL {
    return URL(string: "http://hakburi.synology.me")! // Change your default API domain
  }

  var targetRequest: URLRequest {
    var request: URLRequest = URLRequest(url: self.url)
    request.httpMethod = self.route.method.rawValue
    return request
  }
}
