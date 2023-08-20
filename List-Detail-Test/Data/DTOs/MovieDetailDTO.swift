//
//  MovieDetailDTO.swift
//  List-Detail-Test
//
//  Created by Edwin Peña Sanchez on 20/8/23.
//

import Foundation

struct MovieDetailDTO: Decodable {
    let id: Int
    let title: String
    let genre: String
    let releaseYear: String
    let plot: String
    let posterURL: URL
}
