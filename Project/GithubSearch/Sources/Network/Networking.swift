//
//  Networking.swift
//  GithubSearch
//
//  Created by SungHak Jung on 2021/12/13.
//

import Foundation
import Combine

public protocol NetworkingProtocol {
  func request(_ targetAPI: API) -> AnyPublisher<Data, Error>
}

public final class Networking: NetworkingProtocol {
  public init() {}
  
  public func request(_ targetAPI: API) -> AnyPublisher<Data, Error> {
    return URLSession.shared.dataTaskPublisher(for: targetAPI.targetRequest)
			.tryMap { data, response -> Data in
				guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
					throw URLError(.badServerResponse)
				}
				return data
			}
			.mapError { $0 }
			.eraseToAnyPublisher()
	}
}
