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
        GeometryReader { geometry in
            VStack {
                if let movieDetail = viewModel.movieDetail {
                    VStack(alignment: .leading, spacing: 15)  {
                        RemoteImage(url: movieDetail.posterURL)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: geometry.size.width)
                            .padding(.horizontal)
                        
                        Text(movieDetail.genre)
                            .font(.headline)
                            .padding(.horizontal)
                        
                        Text("Release Year: \(movieDetail.releaseYear)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        Text(movieDetail.plot)
                            .padding(.horizontal)
                        
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
}
