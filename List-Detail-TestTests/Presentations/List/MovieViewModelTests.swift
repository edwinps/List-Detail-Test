//
//  MovieViewModelTests.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

final class MovieViewModelTests: XCTestCase {
    var mockUseCase: MockMovieUseCase!
    var viewModel: MovieListViewModel!

    override func setUp() {
        super.setUp()
        mockUseCase = MockMovieUseCase()
        viewModel = MovieListViewModel(useCase: mockUseCase)
    }

    override func tearDown() {
        mockUseCase = nil
        viewModel = nil
        super.tearDown()
    }

    func testFetchMoviesSuccess() async {
        mockUseCase.fetchMoviesResult = .success([Movie(id: 1, title: "Movie 1"), Movie(id: 2, title: "Movie 2")])

        await viewModel.fetchMovies()

        let expectation = XCTestExpectation(description: "Movies updated")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.movies.count, 2)
            XCTAssertEqual(self.viewModel.movies[0].title, "Movie 1")
            XCTAssertEqual(self.viewModel.movies[1].title, "Movie 2")
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 1.0)
    }

    func testFetchMoviesFailure() async {
        // Mock fetch failure
        mockUseCase.fetchMoviesResult = .failure(NSError(domain: "TestDomain", code: 123, userInfo: nil))

        await viewModel.fetchMovies()

        XCTAssertTrue(viewModel.movies.isEmpty)
    }

}
