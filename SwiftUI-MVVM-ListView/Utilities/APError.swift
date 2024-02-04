//
//  APError.swift
//  XPayBackTask
//
//  Created by Arjun on 01/02/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
}
