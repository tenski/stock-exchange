//
//  Provider.swift
//  stock-exchange
//
//  Created by Алексей Тен on 15.09.2021.
//

import Foundation

class Provider {
    
    let dataFetcher: NetworkDataFetcher
    
    init(dataFetcher: NetworkDataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    func loadData(completion: @escaping (Result<DataFlow.Response,Error>) -> ()) {
        dataFetcher.fetchQuotes { response in
            switch response{
            
            case .success(let data):
                let quotes = data.map {
                    return Quote(ticker: $0.key, rawQuote: $0.value)
                }.sorted {
                    $0.ticker < $1.ticker
                }
                DispatchQueue.main.async {
                    completion(.success(quotes))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
