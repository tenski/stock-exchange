//
//  NetworkService.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import Foundation

class MainService {
    func request(urlString: String, completion: @escaping (Result<[Quote], Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let quotes = try JSONDecoder().decode([String: RawQuote].self, from: data).map {
                    Quote.init(ticker: $0.key, rawQuote: $0.value)
                }
                let data = quotes.sorted {
                    $0.ticker < $1.ticker
                }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                DispatchQueue.main.async {
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
