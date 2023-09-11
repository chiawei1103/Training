//
//  HightSchoolModel.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/7/23.
//

import Foundation

struct HighSchool: Decodable {
    let dbn: String
    let schoolName: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
}

struct HighSchoolDetail: Decodable {
    let dbn: String
    let overviewParagraph: String
    let schoolEmail: String?
    let website: String
    let totalStudents: String
    let primaryAddressLine1: String
    let city: String
    let stateCode: String
    let zip: String
}
