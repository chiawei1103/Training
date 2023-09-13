//
//  SchoolDetailViewModel.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/10/23.
//

import Foundation

class SchoolDetailViewModel {
    private let networkManager = NetworkManager()
    private let schoolDetailURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private var schoolDetailList: [HighSchoolDetail]?
    private(set) var schoolDetail: HighSchoolDetail?
    
    func getSchoolDetail(schoolID: String?) async -> Result<HighSchoolDetail, NetworkManagerError> {
        let result = await networkManager.getDataAsync(urlString: schoolDetailURL, type: [HighSchoolDetail].self)
        
        switch result {
        case .success(let schoolDetailList):
            self.schoolDetailList = schoolDetailList
            guard let schoolID = schoolID else {
                return .failure(.schoolIDMissing)
            }
            guard let schoolDetail = schoolDetailList.first(where: { $0.dbn == schoolID }) else {
                return .failure(.schoolDetailMissing)
            }
            self.schoolDetail = schoolDetail
            return .success(schoolDetail)
            
        case .failure(let failure):
            return .failure(failure)
        }
    }
}
