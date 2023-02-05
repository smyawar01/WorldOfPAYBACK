//
//  NetworkError.swift
//  WorldOfPAYBACK
//
//  Created by muhammad Yawar on 2/4/23.
//

import Foundation

enum NetworkError: Error {
    
    case transportError(Error)
    case serverError(Int)
    case noData
    case decodingError(Error)
}

extension NetworkError {
    
    var localizedDescription: String {
        
        switch self {

        case .noData:
            return NSLocalizedString("No data available....", comment: "User friendly no data error")
        case .serverError(_), .decodingError(_):
            return NSLocalizedString("Something went wrong. Please try again later.", comment: "User friendly technical error")
        case .transportError(let error):
            return error.localizedDescription
        }
    }
}
