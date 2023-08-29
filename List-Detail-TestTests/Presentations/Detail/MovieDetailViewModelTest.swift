//
//  MovieDetailViewModelTest.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 29/8/23.
//

import XCTest
@testable import List_Detail_Test

final class MovieDetailViewModelTests: XCTestCase {
    var mockUseCase: MockMovieUseCase!
    var viewModel: MovieDetailViewModel!
    let movieId = 123

    override func setUp() {
        super.setUp()
        mockUseCase = MockMovieUseCase()
        viewModel = MovieDetailViewModel(movieID: movieId, useCase: mockUseCase)
    }

    override func tearDown() {
        mockUseCase = nil
        viewModel = nil
        super.tearDown()
    }

    func testFetchMovieDetailSuccess() async {
        await viewModel.fetchMovieDetail()
        
        let expectation = XCTestExpectation(description: "Movie updated")
        DispatchQueue.main.async {
            XCTAssertNotNil(self.viewModel.movieDetail)
            XCTAssertEqual(self.viewModel.movieDetail?.title, "title")
            XCTAssertEqual(self.viewModel.movieDetail?.genre, "genre")
            XCTAssertEqual(self.viewModel.movieDetail?.releaseYear, 1986)
            XCTAssertEqual(self.viewModel.movieDetail?.plot, "plot")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 1.0)
    }
    
    func testFetchMovieDetailFailure() async {
        mockUseCase.fetchMovieDetailResult  = .failure(NSError(domain: "TestDomain", code: 123, userInfo: nil))
        
        await viewModel.fetchMovieDetail()
        
        XCTAssertNil(viewModel.movieDetail)
    }
}
