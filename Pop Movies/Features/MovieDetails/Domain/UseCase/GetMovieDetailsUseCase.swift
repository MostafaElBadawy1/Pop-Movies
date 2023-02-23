//
//  GetMovieDetailsUseCase.swift
//  Pop Movies
//
//  Created by mostafa  on 23/02/2023.
//

import Foundation
class GetMovieDetailsUseCase: GetMovieDetailsUseCaseContract {
    let movieDetailsRepository: MovieDetailsRepositoryContract
    init (movieDetailsRepository: MovieDetailsRepositoryContract = MovieDetailsRepository()) {
        self.movieDetailsRepository = movieDetailsRepository
    }
    func getMovieDetails(id: Int, completion : @escaping (MovieDetails?, Error?)-> Void) {
        movieDetailsRepository.getMovieDetails(id: id, completion: completion)
    }
}
