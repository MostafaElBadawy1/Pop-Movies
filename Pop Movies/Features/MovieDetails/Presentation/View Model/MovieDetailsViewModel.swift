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
    
    private let getMovieDetailsUseCase: GetMovieDetailsUseCaseContract
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
    
    init(getMovieDetailsUseCase: GetMovieDetailsUseCaseContract = GetMovieDetailsUseCase(), movieID: Int) {
        self.getMovieDetailsUseCase = getMovieDetailsUseCase
        self.movieID = movieID
    }
    
    func getMovieDetails(id: Int) {
        getMovieDetailsUseCase.getMovieDetails(id: id) { result, error in
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
