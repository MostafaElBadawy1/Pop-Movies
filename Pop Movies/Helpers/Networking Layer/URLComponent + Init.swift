//
//  URLComponent+Init.swift
//  Pop Movies
//
//  Created by mostafa  on 19/02/2023.
//


import Foundation

public extension URLComponents {
    init (scheme: String = "https",
          host: String = "api.themoviedb.org",
          path: String,
          queryItems: [URLQueryItem]? = nil) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}

extension URLComponents {
    
    static func home(apiKey: String, sortBy: String, page: Int) -> Self {
        let queryItems: [URLQueryItem] = [
            .init(name: "api_key", value: apiKey ),
            .init(name: "sort_by", value: sortBy),
            .init(name: "page", value: String(page))]
        return Self(path: "/3/discover/movie", queryItems: queryItems)
    }
    
    static func movieDetails(id: Int) -> Self {
        let queryItems: [URLQueryItem] = [.init(name: "api_key", value: Constants.shared.apiKey)]
        return Self(path: "/3/movie/\(id)", queryItems: queryItems)
    }
}

