//
//  LoadImageUseCase.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

protocol LoadImageUseCase {
    func fetchImage(from url: URL) async throws -> Data
}

struct LoadImageUseCaseImplementation: LoadImageUseCase {
    private let urlSession: URLSessionProtocol

    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }

    func fetchImage(from url: URL) async throws -> Data {
        return try await urlSession.asyncDataTask(with: url).getData()
    }
}
