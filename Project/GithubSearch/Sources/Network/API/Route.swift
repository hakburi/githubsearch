//
//  Route.swift
//  GithubSearch
//
//  Created by SungHak Jung on 2021/12/31.
//

public enum Route {
  case get(String)
  case post(String)
  case put(String)
  case delete(String)
  case patch(String)

  public var uri: String {
    switch self {
    case .get(let uri): return uri
    case .post(let uri): return uri
    case .put(let uri): return uri
    case .delete(let uri): return uri
    case .patch(let uri): return uri
    }
  }

  public var method: Method {
    switch self {
    case .get: return .get
    case .post: return .post
    case .put: return .put
    case .delete: return .delete
    case .patch: return .patch
    }
  }
}
