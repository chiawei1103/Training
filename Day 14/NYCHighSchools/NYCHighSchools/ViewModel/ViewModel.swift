//
//  ViewModel.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/8/23.
//

import Foundation

class ViewModel {
    private let networkManager = NetworkManager()
    private let highSchoolListURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    private(set) var highSchoolList: [HighSchool]?
    
    func getHighSchoolList() async -> Result<[HighSchool], NetworkManagerError> {
        let result = await networkManager.getDataAsync(urlString: highSchoolListURL, type: [HighSchool].self)
        switch result {
        case .success(let highSchoolList):
            self.highSchoolList = highSchoolList
            return .success(highSchoolList)
        case .failure(let failure):
            return .failure(failure)
        }
    }
    
//    func getHighSchoolList(completionHandler: @escaping (NetworkManagerError?) -> Void) {
//        networkManager.getData(urlString: highSchoolListURL, type: [HighSchool].self) { result in
//            switch result {
//            case .success(let highschoolList):
//                self.highSchoolList = highschoolList
//                completionHandler(nil)
//            case .failure(let failure):
//                completionHandler(failure)
//            }
//        }
//    }
}
