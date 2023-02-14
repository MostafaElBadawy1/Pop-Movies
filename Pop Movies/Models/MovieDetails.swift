//
//  Movie.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
struct MovieDetails: Codable {
    let originalTitle: String?
    let posterPath: String?
    let releaseDate: String?
    let runTime: Int?
    let overView: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runTime = "runtime"
        case overView = "overview"
        case voteAverage = "vote_average"
    }
}
