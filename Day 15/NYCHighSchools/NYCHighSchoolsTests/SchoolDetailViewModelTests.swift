//
//  SchoolDetailViewModelTests.swift
//  NYCHighSchoolsTests
//
//  Created by Lawrence on 9/13/23.
//

import XCTest
@testable import NYCHighSchools

final class SchoolDetailViewModelTests: XCTestCase {
    let schoolDetailViewModel = SchoolDetailViewModel(networkManager: NetworkManager())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSchoolDetailViewModel() throws {
        // Invalid School ID
        Task {
            let result = await schoolDetailViewModel.getSchoolDetail(schoolID: "")
            switch result {
            case .success(let schoolDetail):
                XCTAssertNotNil(schoolDetail)
            case .failure(let failure):
                XCTAssertThrowsError(failure, "School ID Missing")
            }
        }
        
        // School Detail Missing
        Task {
            let result = await schoolDetailViewModel.getSchoolDetail(schoolID: "01M458")
            switch result {
            case .success(let schoolDetail):
                XCTAssertNotNil(schoolDetail)
            case .failure(let failure):
                XCTAssertThrowsError(failure, "School Detail Missing")
            }
        }
    }

}
