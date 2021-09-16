//
//  Provider.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import Foundation

class Provider {
    
    private let networkService = NetworkService()
    private let urlString = "https://poloniex.com/public?command=returnTicker"
    
    func fetchQuotes(response: @escaping (Result<[String: RawQuote], Error>) -> ()) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let quotes = try JSONDecoder().decode([String: RawQuote].self, from: data)
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
