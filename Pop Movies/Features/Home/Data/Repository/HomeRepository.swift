//
//  HomeNetwork.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation
class HomeRepository: HomeRepositoryContract {
    let networkLayer: NetworkProtocol
    init (networkLayer: NetworkProtocol = URLSession()) {
        self.networkLayer = networkLayer
    }
    func getHomeMovies(sortBy: String, page: Int = 1, completion : @escaping (HomeMoviesData?, Error?)-> Void) {
        networkLayer.fetchData(for: .home(apiKey: Constants.shared.apiKey, sortBy: sortBy, page: page), responseModel: HomeMoviesData.self, completion: completion)
    }
}

