//
//  MovieDetailViewModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieDetail?
    
    private let movieID: Int
    private let useCase: MovieUseCase
    
    init(movieID: Int, useCase: MovieUseCase) {
        self.movieID = movieID
        self.useCase = useCase
    }
    
    func fetchMovieDetail() async {
        do {
            let fetchMovie = try await useCase.fetchMovieDetail(id: movieID).getData()
            DispatchQueue.main.async {
                self.movieDetail = fetchMovie
            }
        } catch {
            print("Error fetching movie: \(error)")
        }
    }
}
