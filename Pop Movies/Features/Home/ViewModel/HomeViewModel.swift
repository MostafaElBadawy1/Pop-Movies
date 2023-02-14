//
//  HomeViewModel.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import Foundation
class HomeViewModel {
    var preFetchingIndex = 6
    var pageNumber = 2
    var arrengmentType = "popularity.desc"
    var moviesArray = [MoviesResults]()
    var moreMoviesArray = [MoviesResults]()
    var bindingData: (([MoviesResults]?,Error?) -> Void) = {_, _ in}
    var result = [MoviesResults]() {
        didSet {
            bindingData(result, nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    func getHomeMovies(sortBy: String, page: Int) {
        APIManager.shared.fetchData(target: .getHome(apiKey: Constants.shared.apiKey, sortBy: sortBy, page: page), responceModel: HomeMoviesData.self)  { result, error in
            switch result {
            case .some(let data):
                self.result = data.results
            case .none:
                switch error {
                case .some(let error):
                    self.error = error
                case .none:
                    return
                }
            }
        }
    }
    func getMoviesCount() -> Int {
        return moviesArray.count
    }
    func addPrefetchedMovies() {
        moviesArray.append(contentsOf: moreMoviesArray)
    }
}
