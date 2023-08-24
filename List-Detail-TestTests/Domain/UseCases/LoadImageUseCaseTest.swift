//
//  LoadImageUseCaseTest.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

class LoadImageUseCaseTests: XCTestCase {
    var mockURLSession: MockURLSession!
    var loadImageUseCase: LoadImageUseCase!

    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        loadImageUseCase = LoadImageUseCaseImplementation(urlSession: mockURLSession)
    }

    override func tearDown() {
        mockURLSession = nil
        loadImageUseCase = nil
        super.tearDown()
    }

    func testFetchImageSuccess() async {
        guard let sampleImageURL = URL(string: "https://example.com/sample.jpg"),
              let sampleImageData = "SampleImageData".data(using: .utf8),
              let response = HTTPURLResponse(url: sampleImageURL,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
            XCTFail("Should have thrown an error")
            return
        }

        do {
            mockURLSession.mockDataTaskResult = .success((sampleImageData, response))
            let imageData = try await loadImageUseCase.fetchImage(from: sampleImageURL)
            XCTAssertNotNil(imageData)
        } catch {
            XCTFail("Should not have thrown an error")
        }
    }

    func testFetchImageFailure() async {
        guard let sampleImageURL = URL(string: "https://example.com/sample.jpg") else {
            XCTFail("Should have thrown an error")
            return
        }
        mockURLSession.mockDataTaskResult = .failure(NSError(domain: "test", code: 123, userInfo: nil))

        do {
            _ = try await loadImageUseCase.fetchImage(from: sampleImageURL)
            XCTFail("Should have thrown an error")
        } catch {
            XCTAssertEqual((error as NSError).code, 123)
        }
    }

}
