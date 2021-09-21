//
//  Presenter.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

protocol PresentationLogic {
    func presentData(response: DataFlow.Response)
    func presentError(_ error: Error)
    func loadData(completion: @escaping (Result<DataFlow.Response,Error>) -> ())
}

class Presenter: PresentationLogic {
    
    weak var viewController: DisplaysLogic?
    let provider: Provider
    
    init(provider: Provider) {
        self.provider = provider
    }
    
    func loadData(completion: @escaping (Result<DataFlow.Response,Error>) -> ()) {
        provider.fetchQuotes { response in
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
    
    func presentData(response: DataFlow.Response) {
        viewController?.displayData(viewModel: response)
    }
    
    func presentError(_ error: Error) {
        
    }
}
