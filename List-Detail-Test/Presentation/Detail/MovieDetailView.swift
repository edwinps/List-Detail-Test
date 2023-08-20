//
//  MovieDetailView.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack {
            if let movieDetail = viewModel.movieDetail {
                VStack {
                    RemoteImage(url: movieDetail.posterURL)
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                    
                    Text(movieDetail.genre)
                        .font(.headline)
                        .padding()
                    
                    Text("Release Year: \(movieDetail.releaseYear)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Text(movieDetail.plot)
                        .padding()
                    
                    Spacer()
                }
                .navigationBarTitle(viewModel.movieDetail?.title ?? "", displayMode: .inline)
                .padding()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchMovieDetail()
            }
        }
    }
}
