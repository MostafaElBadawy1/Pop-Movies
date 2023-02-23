//
//  HomeViewModel.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import Foundation
import UIKit
class HomeViewModel {
    
    // MARK: - Public Properties
    let getMoviesUseCase: GetMoviesHomeUseCaseContract
    init (getMoviesUseCase: GetMoviesHomeUseCaseContract = GetMoviesHomeUseCase()) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    var preFetchingIndex = 6
    var arrengmentType = "popularity.desc"
    var moviesArray = [MoviesResults]()
    var moreMoviesArray = [MoviesResults]()
    var bindingData: (([MoviesResults]?,Error?) -> Void) = {_, _ in}
    
    // MARK: - Private Properties
    private var pageNumber = 2
    private  var result = [MoviesResults]() {
        didSet {
            bindingData(result, nil)
        }
    }
    
    private  var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
}

// MARK: - View Helpers
extension HomeViewModel {
    func getHomeMovies(sortBy: String, page: Int) {
        getMoviesUseCase.getHomeMovies(sortBy: sortBy, page: page) { result, error in
            switch result {
            case .some(let data):
                self.result = data.results ?? []
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
    
    func getMovieID(indexPath: Int) -> Int {
        guard let movieID = moviesArray[indexPath].id else {return 0}
        return movieID
    }
    
    func getPreFetchingIndex() -> Int {
        return preFetchingIndex
    }
    
    func getPageNumber() -> Int {
        return pageNumber
    }
    
    func getArrengmentType() -> String {
        return arrengmentType
    }
    
    func increasePreFetchingIndexAndPageNumber() {
        preFetchingIndex += 6
        pageNumber += 1
    }
    
    func resetForPrefetching() {
        pageNumber = 2
        preFetchingIndex = 6
    }
    
    func getPosterURL(indexPath: Int) -> String {
        guard let moviePosterPath = moviesArray[indexPath].posterPath else {return ""}
        return moviePosterPath
    }
    
    func createImageURL(indexPath: Int) -> URL {
        let moviePosterPath = getPosterURL(indexPath: indexPath)
        let url = Constants.shared.moviePosterURL
        guard let imageUrl = URL(string: "\(url)\(moviePosterPath)") else {return URL(string: "")!}
        return imageUrl
    }
    
    func initMoviesDetailsVC(indexPath: Int) -> UIViewController {
        let movieDetailsViewModel = MovieDetailsViewModel(movieID: moviesArray[indexPath].id ?? 0)
        let movieDetailsVC = MovieDetailsViewController(viewModel: movieDetailsViewModel)
        return movieDetailsVC
    }
    
}
