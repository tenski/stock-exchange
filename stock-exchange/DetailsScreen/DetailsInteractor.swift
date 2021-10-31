//
//  DetailsInteractor.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import Foundation

protocol DetailsBusinessLogic {
    func loadData(with ticker: String)
}

class DetailsInteractor: DetailsBusinessLogic {
    private let presenter: DetailsPresentationLogic
    private let provider: ProvidesDetails
    
    init(presenter: DetailsPresentationLogic, provider: ProvidesDetails) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func loadData(with ticker: String) {
        guard let quote = provider.fetchQuote(with: ticker) else { return }
        presenter.presentData(response: quote)
    }
}
