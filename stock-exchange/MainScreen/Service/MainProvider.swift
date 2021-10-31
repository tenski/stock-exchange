//
//  Provider.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import Foundation

protocol ProvidesMain {
    func fetchQuotes(completion: @escaping (Result<[Quote], Error>) -> ())
}

class MainProvider: ProvidesMain {
    private let networkService = MainService()
    private let urlString = "https://poloniex.com/public?command=returnTicker"
    private let dataStore: QuoteDataStore = QuoteDataStore.shared
    
    func fetchQuotes(completion: @escaping (Result<[Quote], Error>) -> ()) {
        networkService.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let quotes):
                completion(.success(quotes))
                self?.dataStore.saveQuotes(with: quotes)
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
