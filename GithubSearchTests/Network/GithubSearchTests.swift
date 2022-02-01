//
//  GithubSearchTests.swift
//  GithubSearchTests
//
//  Created by SungHak Jung on 2022/01/31.
//  Copyright © 2022 GenithLabs. All rights reserved.
//

import XCTest
import Combine
import GithubSearch

class GithubSearchTests: XCTestCase {
  private func createNetworking() -> Networking {
    return Networking()
  }

  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func test_GithubServiceUser() throws {
    // given
    let expectation = XCTestExpectation(description: "Fetch Users")
    let networking = self.createNetworking()
    let githubService = GithubService(networking: networking)
    var bag = Set<AnyCancellable>()

    // when
    _ = githubService.users().sink(receiveCompletion: { _ in}) { data in
      // then
        XCTAssertTrue(!data.isEmpty)
        expectation.fulfill()
      }.store(in: &bag)

    wait(for: [expectation], timeout: 3)
  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
}
