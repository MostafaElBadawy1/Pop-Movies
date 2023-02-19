//
//  MovieDetailsViewModel.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
class MovieDetailsViewModel {
    var movie: MovieDetails?
    var bindingData: ((MovieDetails?,Error?) -> Void) = {_, _ in}
    private let apiManager: APIManagerProtocol
    private var movieID: Int
    private var result: MovieDetails? {
        didSet {
            bindingData(result, nil)
        }
    }
    private  var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    
    init(apiManager: APIManagerProtocol = APIManager(), movieID: Int) {
        self.apiManager = apiManager
        self.movieID = movieID
    }
    
    func getMovieDetails() {
        apiManager.fetchData(target: .getMovieDetails(movieID: "\(movieID)"), responceModel: MovieDetails.self)  { result, error in
            switch result {
            case .some(let data):
                self.result = data
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
}
