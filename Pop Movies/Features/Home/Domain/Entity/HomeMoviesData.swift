//
//  HomeModel.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
struct HomeMoviesData: Decodable {
    let results: [MoviesResults]?
}
struct MoviesResults: Decodable {
    let posterPath: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id
    }
}
