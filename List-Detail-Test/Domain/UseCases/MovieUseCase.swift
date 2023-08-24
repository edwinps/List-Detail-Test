//
//  MovieUseCase.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

protocol MovieUseCase {
    func fetchMovies() async -> AsyncResult<[Movie], Error>
    func fetchMovieDetail(id: Int) async -> AsyncResult<MovieDetail, Error>
}

struct MovieUseCaseImplementation: MovieUseCase {
    private let urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchMovies() async -> AsyncResult<[Movie], Error> {
        do {
            let url = Environment.apiUrl.appendingPathComponent("/movies")
            let data = try await urlSession.asyncDataTask(with: url).getData()
            let dto = try JSONDecoder().decode([MovieDTO].self, from: data)
            let movies = dto.map(transformDTOToMovies)
            return .success(movies)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchMovieDetail(id: Int) async -> AsyncResult<MovieDetail, Error> {
        do {
            let url = Environment.apiUrl.appendingPathComponent("/detail/\(id)")
            let data = try await urlSession.asyncDataTask(with: url).getData()
            let dto = try JSONDecoder().decode(MovieDetailDTO.self, from: data)
            let movie = transformDTOToMovieDetail(dto)
            return .success(movie)
        } catch {
            return .failure(error)
        }
    }
}

private extension MovieUseCaseImplementation {
    func transformDTOToMovies(_ dto: MovieDTO) -> Movie {
        return Movie(id: dto.id, title: dto.title)
    }
    
    func transformDTOToMovieDetail(_ dto: MovieDetailDTO) -> MovieDetail {
        return MovieDetail(id: dto.id,
                           title: dto.title,
                           genre: dto.genre,
                           releaseYear: dto.releaseYear,
                           plot: dto.plot,
                           posterURL: URL(string: dto.posterURL))
    }
}
