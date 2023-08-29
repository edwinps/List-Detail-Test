//
//  MovieListViewModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//
import Foundation

final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let useCase: MovieUseCase
    
    init(useCase: MovieUseCase = MovieUseCaseImplementation()) {
        self.useCase = useCase
    }
    
    func fetchMovies() async {
        do {
            let fetchedMovies = try await useCase.fetchMovies().getData()
            DispatchQueue.main.async {
                self.movies = fetchedMovies
            }
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}
