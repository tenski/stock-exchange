//
//  NetworkDataFetcher.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    
    func fetchQuotes(urlString: String, response: @escaping (SearchResponse?) -> ()) {
        
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let quotes = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(quotes)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
