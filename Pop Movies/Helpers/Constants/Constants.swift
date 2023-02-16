//
//  Constants.swift
//  Pop Movies
//
//  Created by mostafa  on 12/02/2023.
//

import Foundation
class Constants {
    static let shared = Constants()
    private init () {}
    let baseURl = "https://api.themoviedb.org/3/"
    let apiKey = "2ddab98eebacf2ae66405362b4598826"
    let moviePosterURL = "https://image.tmdb.org/t/p/w185/"
    let homeCollectionViewCell = "HomeCollectionViewCell"
    let mostPopulerMenuButtonTitle = "Most Populer"
    let mostPopulerMenuButtonArrengmentType = "popularity.desc"
    let topRatedMenuButtonTitle = "Top Rated"
    let topRatedMenuButtonArrengmentType = "vote_average.desc"
    let arrengmentTypeMenuTitle = "Choose Movies Order"
    let youTubeURL = "https://www.youtube.com/"
    let moviesDetailsVCErrorMessage = "Error While Loading Movie Details"
    let homeVCErrorMessage = "Error While Loading Movies "
}
