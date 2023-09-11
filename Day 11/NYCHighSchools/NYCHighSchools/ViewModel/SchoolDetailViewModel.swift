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
    
    func getSchoolDetail(schoolID: String?, completionHandler: @escaping (Result<HighSchoolDetail?, NetworkManagerError>) -> Void) {
        networkManager.getData(urlString: schoolDetailURL, type: [HighSchoolDetail].self) { result in
            switch result {
            case .success(let schoolDetailList):
                guard let schoolID = schoolID else {
                    completionHandler(.failure(.schoolIDMissing))
                    return
                }
                self.schoolDetail = schoolDetailList.first(where: { $0.dbn == schoolID })
                print("schoolDetail: \(self.schoolDetail)")
                completionHandler(.success(self.schoolDetail))
            case .failure(_):
                completionHandler(.failure(.urlSessionFailed))
            }
        }
    }
}
