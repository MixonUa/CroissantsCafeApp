//
//  NetworkImageDownloader.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 16.03.2024.
//

import Foundation

class NetworkImageDownloader {
    private var networkDataProvider: NetworkServiceProtocol
    
    init(networkDataProvider: NetworkServiceProtocol) {
        self.networkDataProvider = networkDataProvider
    }
    
    func requestImagesData(from url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        networkDataProvider.requestData(urlString: url) { (data, error) in
            if let cathedError = error {
                if let err = cathedError as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                    completion(.failure(NetworkError.noConnection)); return
                } else {
                    completion(.failure(NetworkError.serverError(error: cathedError))); return
                }
            }
            if let data = data {
                completion(.success(data))
            }
        }
    }
}
