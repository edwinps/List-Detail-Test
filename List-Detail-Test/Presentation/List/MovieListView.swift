//
//  ListView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieViewModel
    @EnvironmentObject private var coordinator: Coordinator
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            NavigationStack(path: $coordinator.path) {
                List(viewModel.movies) { movie in
                    Button(action: {
                        coordinator.movieID = movie.id
                        coordinator.push(.detail)
                    }) {
                        Text(movie.title)
                    }
                }
                .onAppear {
                    Task {
                        await viewModel.fetchMovies()
                    }
                }
                .refreshable {
                    await viewModel.fetchMovies()
                }
                .navigationTitle("Movies")
            }
        }
    }
}
