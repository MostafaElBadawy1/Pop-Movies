//
//  MovieDetailsRepository.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation

class MovieDetailsRepository: MovieDetailsRepositoryContract {
    let networkLayer: NetworkProtocol
    init (networkLayer: NetworkProtocol = URLSession()) {
        self.networkLayer = networkLayer
    }
    func getMovieDetails(id: Int, completion : @escaping (MovieDetails?, Error?)-> Void) {
        networkLayer.fetchData(for: .movieDetails(id: id), responseModel: MovieDetails.self, completion: completion)
    }
}

