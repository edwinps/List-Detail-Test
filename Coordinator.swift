//
//  Coordinator.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI
import Foundation

enum Page: String, Identifiable {
    case list
    case detail
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    private let movieUseCase: MovieUseCase
    var movieID: Int?
    
    init(movieUseCase: MovieUseCase = MovieUseCaseImplementation()) {
        self.movieUseCase = movieUseCase
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .list:
            let viewModel = MovieViewModel(useCase: movieUseCase)
            MovieListView(viewModel: viewModel)
        case .detail:
            if let movieID = self.movieID {
                let viewModel = MovieDetailViewModel(movieID: movieID,
                                                     useCase: movieUseCase)
                MovieDetailView(viewModel: viewModel)
            }
        }
    }
}
