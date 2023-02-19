//
//  URLSession + Client.swift
//  Pop Movies
//
//  Created by mostafa  on 19/02/2023.
//

import Foundation

protocol NetworkProtocol {
    func fetchData<M:Decodable>(for request: URLRequest, responceModel:M.Type, completion: @escaping (M?, Error?)-> Void)
}

extension URLSession: NetworkProtocol {

    func fetchData<M:Decodable>(for request: URLRequest, responceModel:M.Type, completion: @escaping (M?, Error?)-> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil {
                completion(nil, error)
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(nil, error)
                return
            }
            do {
                let json = try JSONDecoder().decode(responceModel, from: data!)
                print( "New Netwok Layer<<<<>>>>\(json)")
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
    }
}
