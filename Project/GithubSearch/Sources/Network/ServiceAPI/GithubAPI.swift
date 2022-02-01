//
//  GithubAPI.swift
//  GithubSearch
//
//  Created by SungHak Jung on 2021/12/31.
//

import Foundation

public enum GithubAPI {
  case user // FIXME: 테스트용 삭제 필요!
}

extension GithubAPI: API {
  public var domain: String {
    return "http://hakburi.synology.me"
  }

  public var url: URL {
    return URL(string: self.domain + self.route.uri) ?? self.defaultURL
  }

  public var route: Route {
    switch self {
    case .user:
      return .get("/json/users.php")
    }
  }
}
