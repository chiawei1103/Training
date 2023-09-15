//
//  ViewModelTests.swift
//  NYCHighSchoolsTests
//
//  Created by Lawrence on 9/13/23.
//

import XCTest
@testable import NYCHighSchools

final class ViewModelTests: XCTestCase {
    let viewModel = ViewModel(networkManager: NetworkManager())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetHightSchoolList() throws {
        Task {
            let result = await viewModel.getHighSchoolList()
            switch result {
            case .success(let highSchoolList):
                XCTAssertEqual(highSchoolList.count, 478)
            case .failure(let failure):
                XCTAssertThrowsError(failure)
            }
        }
    }
}
