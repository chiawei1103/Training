//
//  ViewModel.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/8/23.
//

import Foundation

class ViewModel {
    private let networkManager: NetworkPortable
    private let highSchoolListURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    private(set) var highSchoolList: [HighSchool]?
    
    init(networkManager: NetworkPortable) {
        self.networkManager = networkManager
    }
    
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
}
