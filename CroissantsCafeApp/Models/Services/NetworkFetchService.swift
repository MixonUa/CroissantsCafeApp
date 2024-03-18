//
//  NetworkFetchService.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 12.03.2024.
//

import Foundation

class NetworkFetchService  {
    
    private var networkDataProvider: NetworkServiceProtocol
    
    init(networkDataProvider: NetworkServiceProtocol) {
        self.networkDataProvider = networkDataProvider
    }
    
    func requestCroissantsData(completion: @escaping (Result<[CroissantsDataModel], Error>) -> Void) {
        let newsURL = "https://raw.githubusercontent.com/MixonUa/JSON-Croissants/main/CroissantsMenuJSON.txt"
        networkDataProvider.requestData(urlString: newsURL) { (data, error) in
            if let cathedError = error {
                if let err = cathedError as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                    completion(.failure(NetworkError.noConnection)); return
                } else {
                    completion(.failure(NetworkError.serverError(error: cathedError))); return }
                }
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode([CroissantsDataModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(answer))
                    }
                } catch let decodingError {
                    DispatchQueue.main.async {
                        completion(.failure(decodingError))
                    }
                }
            }
        }
    }
    
    func requestPromoData(completion: @escaping (Result<[PromoDataModel], Error>) -> Void) {
        let newsURL = "https://raw.githubusercontent.com/MixonUa/JSON-Croissants/main/CroissantsPromoJSON.txt"
        networkDataProvider.requestData(urlString: newsURL) { (data, error) in
            if let cathedError = error {
                if let err = cathedError as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                    completion(.failure(NetworkError.noConnection)); return
                } else {
                    completion(.failure(NetworkError.serverError(error: cathedError))); return }
                }
            if let data = data {
                do {
                    let answer = try JSONDecoder().decode([PromoDataModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(answer))
                    }
                } catch let decodingError {
                    DispatchQueue.main.async {
                        completion(.failure(decodingError))
                    }
                }
            }
        }
    }
}
