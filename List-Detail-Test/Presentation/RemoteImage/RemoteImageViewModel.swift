//
//  RemoteImageViewModel.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

class RemoteImageViewModel: ObservableObject {
    @Published var imageData: Data?
    private let loadImageUseCase: LoadImageUseCase
    
    init(loadImageUseCase: LoadImageUseCase = LoadImageUseCaseImplementation()) {
        self.loadImageUseCase = loadImageUseCase
    }
    
    func loadImage(from url: URL) async {
        do {
            self.imageData = try await loadImageUseCase.fetchImage(from: url)
        } catch {
            print("Error loading image: \(error)")
        }
    }
}
