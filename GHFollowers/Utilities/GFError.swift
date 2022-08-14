//
//  GFError.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "INVALID_USERNAME"
    case unableToComplete = "UNABLE_TO_COMPLETE";
    case invalidResponse = "INVALID_RESPONSE"
    case invalidData = "INVALID_DATA"
}
