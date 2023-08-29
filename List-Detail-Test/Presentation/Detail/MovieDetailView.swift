//
//  MovieDetailView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @EnvironmentObject private var coordinatorViewModel: CoordinatorViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if let movieDetail = viewModel.movieDetail {
                    buildDetail(with: movieDetail,
                                geometry: geometry)
                } else {
                    buildProgressView(width: geometry.size.width,
                                      height: geometry.size.height)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchMovieDetail()
                }
            }
        }
    }
}

private extension MovieDetailView {
    func buildDetail(with model: MovieDetail, geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading, spacing: 15)  {
            buildRemoteImage(with: model.posterURL,
                             width: geometry.size.width)
            Text(model.genre)
                .font(.headline)
                .padding(.horizontal)
            
            Text("Release Year: \(model.releaseYear)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            Text(model.plot)
                .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle(viewModel.movieDetail?.title ?? "")
        .padding()
    }
    
    func buildRemoteImage(with url: URL?, width: Double) -> some View {
        RemoteImage(url: url)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: width)
            .padding(.horizontal)
    }
    func buildProgressView(width: Double, height: Double) -> some View {
        ProgressView()
            .frame(width: width, height: height)
            .ignoresSafeArea()
    }
}
