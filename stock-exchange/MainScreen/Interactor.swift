//
//  Interactor.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

protocol InteractorBusinessLogic {
    func loadData()
}

class Interactor: InteractorBusinessLogic {
    
    private let presenter: PresentationLogic
    private let provider: Provider
    
    init(presenter: PresentationLogic, provider: Provider) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func loadData() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            self?.provider.fetchQuotes { [weak self] (fetch) in
                guard let self = self else { return }
                
                switch fetch {
                case .success(let data):
                    
                    let quotes = data.map {
                        return Quote(ticker: $0.key, rawQuote: $0.value)
                    }.sorted {
                        $0.ticker < $1.ticker
                    }
                    DispatchQueue.main.async {
                        self.presenter.presentData(response: quotes)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.presenter.presentError(error)
                    }
                }
            }
        }
    }
}
