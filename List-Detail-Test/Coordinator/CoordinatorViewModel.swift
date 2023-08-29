//
//  CoordinatorViewModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 29/8/23.
//

import SwiftUI

enum Destination: Codable, Hashable {
    case list
    case detail(id: Int)
}

final class CoordinatorViewModel: ObservableObject {
    @Published var path = NavigationPath()
    private var movieListViewModel = MovieListViewModel()
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func buildView(for destination: Destination) -> some View {
        switch destination {
        case .list:
            MovieListView(viewModel: movieListViewModel)
        case .detail(let id):
            MovieDetailView(viewModel: MovieDetailViewModel(movieID: id))
        }
    }
}
