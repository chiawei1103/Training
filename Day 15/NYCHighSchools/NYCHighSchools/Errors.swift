//
//  Errors.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/8/23.
//

import Foundation

enum NetworkManagerError: Error {
    case urlFailed
    case urlSessionFailed
    case dataDecodedFailed
    case schoolIDMissing
    case schoolDetailMissing
}

extension NetworkManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .urlFailed:
            return NSLocalizedString("URL Parsing Failed", comment: "")
        case .urlSessionFailed:
            return NSLocalizedString("URL Session Failed", comment: "")
        case .dataDecodedFailed:
            return NSLocalizedString("JSON Decoder Failed", comment: "")
        case .schoolIDMissing:
            return NSLocalizedString("School ID Missing", comment: "")
        case .schoolDetailMissing:
            return NSLocalizedString("School Detail Missing", comment: "")
        }
    }
}
