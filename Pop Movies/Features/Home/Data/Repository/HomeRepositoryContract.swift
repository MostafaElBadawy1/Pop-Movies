//
//  HomeRepositoryContract.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation
protocol HomeRepositoryContract {
    func getHomeMovies(sortBy: String, page: Int, completion : @escaping (HomeMoviesData?, Error?)-> Void)
}
