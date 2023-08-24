//
//  RemoteImage.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject private var viewModel: RemoteImageViewModel
    
    init(url: URL?) {
        self.viewModel = RemoteImageViewModel(url: url)
    }

    var body: some View {
        VStack {
            if let imageData = viewModel.imageData,
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
            }
        }.onAppear {
            Task {
                await viewModel.loadImage()
            }
        }
    }
}
