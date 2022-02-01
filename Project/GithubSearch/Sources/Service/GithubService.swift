//
//  GithubService.swift
//  GithubSearch
//
//  Created by SungHak Jung on 2021/12/31.
//

import Foundation
import Combine

public protocol GithubServiceProtocol {
  func users() -> AnyPublisher<Data, Error>
}

public final class GithubService: GithubServiceProtocol {
  let networking: Networking

  public init(networking: Networking) {
    self.networking = networking
  }

  public func users() -> AnyPublisher<Data, Error> {
    return self.networking.request(GithubAPI.user)
  }
}
