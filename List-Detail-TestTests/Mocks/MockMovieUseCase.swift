//
//  MockMovieUseCase.swift
//  List-Detail-TestTests
//
//  Created by Edwin Peña Sanchez on 24/8/23.
//

import XCTest
@testable import List_Detail_Test

final class MockMovieUseCase: MovieUseCase {
    var fetchMoviesResult: AsyncResult<[Movie], Error> = .success([])
    var fetchMovieDetailResult: AsyncResult<MovieDetail, Error> = .success(MovieDetail(id: 0,
                                                                                       title: "title",
                                                                                       genre: "genre",
                                                                                       releaseYear: 1986,
                                                                                       plot: "plot",
                                                                                       posterURL: URL(string: "https://example.com")!))
    
    func fetchMovies() async -> AsyncResult<[Movie], Error> {
        return fetchMoviesResult
    }
    
    func fetchMovieDetail(id: Int) async -> AsyncResult<MovieDetail, Error> {
        return fetchMovieDetailResult
    }
}
