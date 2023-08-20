//
//  AsyncResult.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

enum AsyncResult<T, E: Error> {
    case success(T)
    case failure(E)
 
    func getData() async throws -> T {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}
