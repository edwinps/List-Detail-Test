//
//  MovieUseCaseTests.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

class MovieUseCaseTests: XCTestCase {
    var mockURLSession: MockURLSession!
    var movieUseCase: MovieUseCase!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        movieUseCase = MovieUseCaseImplementation(urlSession: mockURLSession)
    }
    
    override func tearDown() {
        mockURLSession = nil
        movieUseCase = nil
        super.tearDown()
    }
    
    func testFetchMoviesSuccess() async throws {
        guard let testDataURL = Bundle(for: type(of: self)).url(forResource: "movies", withExtension: "json"),
              let response = HTTPURLResponse(url: testDataURL,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
            XCTFail("Test data file not found")
            return
        }
        
        let testData = try Data(contentsOf: testDataURL)
        mockURLSession.mockDataTaskResult = .success((testData, response))
        
        let result = await movieUseCase.fetchMovies()
        
        switch result {
        case .success(let movies):
            XCTAssertEqual(movies.count, 5)
        case .failure:
            XCTFail("Should not have failed")
        }
    }
    
    func testFetchMoviesFailure() async throws {
        mockURLSession.mockDataTaskResult = .failure(NSError(domain: "test", code: 123, userInfo: nil))
        
        let result = await movieUseCase.fetchMovies()
        
        switch result {
        case .success:
            XCTFail("Should not have succeeded")
        case .failure(let error):
            XCTAssertEqual((error as NSError).code, 123)
        }
    }
    
    func testFetchMovieDetailSuccess() async throws {
        guard let testDataURL = Bundle(for: type(of: self)).url(forResource: "details", withExtension: "json"),
              let response = HTTPURLResponse(url: testDataURL,
                                             statusCode: 200,
                                             httpVersion: nil,
                                             headerFields: nil) else {
            XCTFail("Test data file not found")
            return
        }
        
        let testData = try Data(contentsOf: testDataURL)
        mockURLSession.mockDataTaskResult = .success((testData, response))
        
        let result = await movieUseCase.fetchMovieDetail(id: 1)
        
        switch result {
        case .success(let movie):
            XCTAssertEqual(movie.id, 1)
        case .failure:
            XCTFail("Should not have failed")
        }
    }
    
    func testFetchMovieDetailFailure() async throws {
        mockURLSession.mockDataTaskResult = .failure(NSError(domain: "test", code: 123, userInfo: nil))
        
        let result = await movieUseCase.fetchMovieDetail(id: 2)
        
        switch result {
        case .success:
            XCTFail("Should not have succeeded")
        case .failure(let error):
            XCTAssertEqual((error as NSError).code, 123)
        }
    }
    
}
