//
//  URLRequest + Buider.swift
//  Pop Movies
//
//  Created by mostafa  on 19/02/2023.
//

import Foundation
import Alamofire

public enum HTTPMethods: String {
    case get = "GET"
}

public extension URLRequest {
    
    init(components: URLComponents) {
        guard let url = components.url else {
            preconditionFailure("Unable to get URL from URLComponent: \(components)")
        }
        self = Self(url: url).add(header: ["Content-Type": "application/json"])
        
    }
    private func map(_ transform: (inout Self) -> ()) -> Self {
        var request = self
        transform(&request)
        return request
    }
    
    func add(httpMethod: HTTPMethod) -> Self {
        map {$0.httpMethod = httpMethod.rawValue}
    }
    
    func add<Body: Encodable>(body: Body) -> Self {
        map {
            do {
                $0.httpBody = try JSONEncoder().encode(body)
            } catch {
                preconditionFailure("Failed to encode request Body: \(body) due to Error: \(error)")
            }
        }
    }
    
    func add(header: [String: String]) -> Self {
        map {
            let allHttpHeaderFields = $0.allHTTPHeaderFields ?? [:]
            
            let updatedAllHttpHeaderFields = header.merging(allHttpHeaderFields, uniquingKeysWith: { $1 })
            $0.allHTTPHeaderFields = updatedAllHttpHeaderFields
        }
    }
}

extension URLRequest {
    static var home: Self {
        Self(components: .home(apiKey: "2ddab98eebacf2ae66405362b4598826", sortBy: "popularity.desc", page: "1"))
    }
    static var movieDetails: Self {
        Self(components: .movieDetails(id: ""))
    }
}
