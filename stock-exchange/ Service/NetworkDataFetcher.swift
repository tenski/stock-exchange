//
//  NetworkDataFetcher.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import Foundation

class NetworkDataFetcher {
    
    private let networkService = NetworkService()
    private let urlString = "https://poloniex.com/public?command=returnTicker"
    
    /*init(urlString: String) {
        self.urlString = urlString
    }*/
    
    func fetchQuotes(response: @escaping (Result<DataFlow.Response, Error>) -> ()) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let quotes = try JSONDecoder().decode(DataFlow.Response.self, from: data)
                    response(.success(quotes))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(.failure(jsonError))
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(.failure(error))
            }
        }
    }
}
