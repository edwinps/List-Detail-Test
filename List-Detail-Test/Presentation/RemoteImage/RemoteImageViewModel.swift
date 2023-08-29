//
//  RemoteImageViewModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

final class RemoteImageViewModel: ObservableObject {
    @Published var imageData: Data?
    private let url: URL?
    private let loadImageUseCase: LoadImageUseCase
    
    init(url: URL?,
         loadImageUseCase: LoadImageUseCase = LoadImageUseCaseImplementation()) {
        self.url = url
        self.loadImageUseCase = loadImageUseCase
    }
    
    func loadImage() async {
        do {
            if let url = url {
                let imageData = try await loadImageUseCase.fetchImage(from: url)
                DispatchQueue.main.async {
                    self.imageData = imageData
                }
            }
        } catch {
            print("Error loading image: \(error)")
        }
    }
}
