//
//  ListView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel
    @EnvironmentObject private var coordinatorViewModel: CoordinatorViewModel
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView()  {
            List(viewModel.movies) { movie in
                Button(movie.title) {
                    coordinatorViewModel.navigate(to: .detail(id: movie.id))
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
