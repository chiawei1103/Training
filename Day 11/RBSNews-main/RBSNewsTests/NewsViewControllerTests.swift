//
//  NewsViewControllerTests.swift
//  RBSNewsTests
//
//  Created by Lawrence on 9/8/23.
//

import XCTest

final class NewsViewControllerTests: XCTestCase {
    let newsViewModel = NewsViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsModelArticles() {
        newsViewModel.parseJSON { error in
            if let error = error {
                XCTAssertThrowsError(error)
            } else {
                XCTAssertEqual(self.newsViewModel.articles!.count, 6, "Articless count is not matching!")
            }
        }
    }

}
