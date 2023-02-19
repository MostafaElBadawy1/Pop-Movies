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
<<<<<<< Updated upstream
    private let apiManager: APIManaging
=======
    private let networkLayer: NetworkProtocol
>>>>>>> Stashed changes
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
    
<<<<<<< Updated upstream
    init(apiManager: APIManaging = APIManager(), movieID: Int) {
        self.apiManager = apiManager
=======
    init (networkLayer: NetworkProtocol = URLSession(), movieID: Int) {
        self.networkLayer = networkLayer
>>>>>>> Stashed changes
        self.movieID = movieID
    }
    
    func getMovieDetails() {
        networkLayer.fetchData(for: .movieDetails(id: movieID), responseModel: MovieDetails.self)  { result, error in
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
