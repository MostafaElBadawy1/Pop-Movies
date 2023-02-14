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
}
