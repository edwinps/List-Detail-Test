//
//  MockLoadImageUseCase.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

final class MockLoadImageUseCase: LoadImageUseCase {
    var result: Result<Data, Error> = .success(Data())
    
    func fetchImage(from url: URL) async throws -> Data {
        switch result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
}
