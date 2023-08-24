//
//  MockURLSession.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

final class MockURLSession: URLSessionProtocol {
    var mockDataTaskResult: AsyncResult<(Data, URLResponse), Error>?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let result = mockDataTaskResult {
            switch result {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
        fatalError("Mock result not set")
    }
}
