//
//  NetworkRouter.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
import Alamofire
enum NetworkRouter {
    // https://api.themoviedb.org/3/ discover/movie?sort_by=vote_average.desc&api_key=2ddab98eebacf2ae66405362b4598826&page=2
    //  https://api.themoviedb.org/3/ movie/1084049?api_key=2ddab98eebacf2ae66405362b4598826
    case getHome(apiKey: String, sortBy: String, page: Int)
    case getMovieDetails(movieID: String)
    
    var baseURL: String {
        switch self {
        case .getHome, .getMovieDetails:
            return Constants.shared.baseURl
        }
    }
    var path: String {
        switch self {
        case .getHome:
            return "discover/movie"
            
        case .getMovieDetails(let movieID):
            return "movie/\(movieID)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getHome, .getMovieDetails :
            return .get
        }
    }
    var parameters: [String: String]? {
        switch self {
        case .getHome(let apiKey, let sortBy, let page):
            return ["api_key": apiKey, "sort_by": sortBy, "page": "\(page)"]
        case .getMovieDetails:
            return ["api_key": "2ddab98eebacf2ae66405362b4598826"]
        }
    }
}
// MARK: - URLRequestConvertible
extension NetworkRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        //  print(path)
        //  print(url)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        print(request)
        return request
    }
}
//struct HomeScreenData {
//    let apiKey: String
//    let sortBy: String
//    let page: String
//    let url = "\(page)"
//}
