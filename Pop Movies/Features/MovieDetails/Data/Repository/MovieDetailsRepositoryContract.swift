//
//  MovieDetailsRepositoryContract.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation
protocol MovieDetailsRepositoryContract {
   func getMovieDetails(id: Int, completion : @escaping (MovieDetails?, Error?)-> Void)
}
