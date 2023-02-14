//
//  APIManager.swift
//  Pop Movies
//
//  Created by mostafa  on 13/02/2023.
//

import Foundation
import Alamofire
class APIManager {
    private init() {}
    static let shared = APIManager()
    let sessionManager: Session = {
            let configuration = URLSessionConfiguration.af.default
            configuration.requestCachePolicy = .returnCacheDataElseLoad
            configuration.waitsForConnectivity = true
            let responseCacher = ResponseCacher(behavior: .modify { _, response in
                let userInfo = ["date": Date()]
                return CachedURLResponse(
                    response: response.response,
                    data: response.data,
                    userInfo: userInfo,
                    storagePolicy: .allowed)
            })
            return Session(
                configuration: configuration,
                cachedResponseHandler: responseCacher
            )
        }()
   
    func fetchData<M:Decodable>(target: NetworkRouter, responceModel:M.Type, completion: @escaping (M?, Error?)-> Void) {
        sessionManager.request( target as URLRequestConvertible).responseDecodable(of: responceModel) { responce in
            print(responce)
            switch responce.result {
            case .success(_):
                guard let items = responce.value else {
                    return
                }
                completion(items,nil)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil, error)
            }
        }
     
    }
}
