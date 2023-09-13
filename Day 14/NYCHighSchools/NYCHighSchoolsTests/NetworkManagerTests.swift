//
//  NetworkManagerTests.swift
//  NYCHighSchoolsTests
//
//  Created by Lawrence on 9/13/23.
//

import XCTest
@testable import NYCHighSchools

final class NetworkManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkManager() throws {
        let networkManager = NetworkManager()
        
        // Invalid URL
        Task {
            let result = await networkManager.getDataAsync(urlString: "https://abc.com", type: [HighSchool].self)
            switch result {
            case .success(let highSchoolList):
                XCTAssertEqual(highSchoolList.count, 478, "High School count is not matching!")
            case .failure(let failure):
                XCTAssertThrowsError(failure, "URL Parsing Failed")
            }
        }
        
        // JSON Decode Fail (Invalid data type)
        Task {
            let result = await networkManager.getDataAsync(urlString: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json", type: [HighSchool].self)
            switch result {
            case .success(let highSchoolList):
                XCTAssertEqual(highSchoolList.count, 478, "High School count is not matching!")
            case .failure(let failure):
                XCTAssertThrowsError(failure, "JSON Decoder Failed")
            }
        }
    
    }

}
