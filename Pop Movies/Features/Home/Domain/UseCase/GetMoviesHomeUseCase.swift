//
//  HomeUseCase.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation

class GetMoviesHomeUseCase: GetMoviesHomeUseCaseContract {
    let repo: HomeRepositoryContract
    init(repo: HomeRepositoryContract = HomeRepository()) {
        self.repo = repo
    }
    func getHomeMovies(sortBy: String, page: Int, completion: @escaping (HomeMoviesData?, Error?) -> Void) {
        repo.getHomeMovies(sortBy: sortBy, page: page, completion: completion)
    }
}
