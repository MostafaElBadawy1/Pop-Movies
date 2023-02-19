//
//  URLComponentsExtention.swift
//  Pop Movies
//
//  Created by mostafa  on 16/02/2023.
//

//import Alamofire
//
//public extension URLComponents {
//    init (scheme: String = "https",
//          host: String = "api.themoviedb.org",
//          path: String,
//          queryItems: [URLQueryItem]? = nil) {
//        var components = URLComponents()
//        components.scheme = scheme
//        components.host = host
//        components.path = path
//        components.queryItems = queryItems
//        self = components
//    }
//}
//
//extension URLComponents {
//
////    static var home: Self {
////        Self(path: "discover/movie")
////    }
//    //
//    //    static var movieDetails: Self {
//    //        Self(path: "discover/movie")
//    //    }
//
//    static func home(apiKey: String, sortBy: String, page: String) -> Self {
//        let queryItems: [URLQueryItem] = [
//            .init(name: "api_key", value: apiKey ),
//            .init(name: "sort_by", value: sortBy),
//            .init(name: "page", value: page)]
//        return Self(path: "/3/discover/movie", queryItems: queryItems)
//    }
//
//    static func movieDetails(id: String) -> Self {
//        let queryItems: [URLQueryItem] = [.init(name: "api_key", value: "2ddab98eebacf2ae66405362b4598826")]
//        return Self(path: "movie/\(id)", queryItems: queryItems)
//    }
//}

//public enum HTTPMethods: String {
//    case get = "GET"
//}

//public extension URLRequest {
//
//    init(components: URLComponents) {
//        guard let url = components.url else {
//            preconditionFailure("Unable to get URL from URLComponent: \(components)")
//        }
//        self = Self(url: url).add(header: ["Content-Type": "application/json"])
//
//    }
//    private func map(_ transform: (inout Self) -> ()) -> Self {
//        var request = self
//        transform(&request)
//        return request
//    }
//
//    func add(httpMethod: HTTPMethod) -> Self {
//        map {$0.httpMethod = httpMethod.rawValue}
//    }
//
//    func add<Body: Encodable>(body: Body) -> Self {
//        map {
//            do {
//                $0.httpBody = try JSONEncoder().encode(body)
//            } catch {
//                preconditionFailure("Failed to encode request Body: \(body) due to Error: \(error)")
//            }
//        }
//    }
//
//    func add(header: [String: String]) -> Self {
//        map {
//            let allHttpHeaderFields = $0.allHTTPHeaderFields ?? [:]
//
//            let updatedAllHttpHeaderFields = header.merging(allHttpHeaderFields, uniquingKeysWith: { $1 })
//            $0.allHTTPHeaderFields = updatedAllHttpHeaderFields
//        }
//    }
//}
//struct HomeRequestBody:

//extension URLRequest {
//    static var home: Self {
//        Self(components: .home(apiKey: "2ddab98eebacf2ae66405362b4598826", sortBy: "popularity.desc", page: "1"))
//    }
//}




//protocol NetworkProtocol {
//    func fetchData<M:Decodable>(for request: URLRequest, responceModel:M.Type, completion: @escaping (M?, Error?)-> Void)
//}
//
//extension URLSession: NetworkProtocol {
//    
//    func fetchData<M:Decodable>(for request: URLRequest, responceModel:M.Type, completion: @escaping (M?, Error?)-> Void) {
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if error == nil {
//                completion(nil, error)
//            }
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                completion(nil, error)
//                return
//            }
//            do {
//                let json = try JSONDecoder().decode(responceModel, from: data!)
//                print( "New Netwok Layer<<<<>>>>\(json)")
//            } catch {
//                print("JSON error: \(error.localizedDescription)")
//                completion(nil, error)
//            }
//        }.resume()
//    }
//}



