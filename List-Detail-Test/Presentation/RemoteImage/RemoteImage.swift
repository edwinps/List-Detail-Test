//
//  RemoteImage.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct RemoteImage: View {
    private var viewModel: RemoteImageViewModel
    private let url: URL
    
    init(url: URL) {
        self.url = url
        self.viewModel = RemoteImageViewModel()
    }

    var body: some View {
        if let imageData = viewModel.imageData,
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    Task {
                        await viewModel.loadImage(from: url)
                    }
                }
        } else {
            Color.gray
                .frame(width: 50, height: 50)
        }
    }
}
