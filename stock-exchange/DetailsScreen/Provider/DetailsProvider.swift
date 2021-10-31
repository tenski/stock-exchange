//
//  DetailsProvider.swift
//  stock-exchange
//
//  Created by Алексей Тен on 04.10.2021.
//

import Foundation

protocol ProvidesDetails {
    func fetchQuote(with ticker: String) -> Quote?
}

class DetailsProvider: ProvidesDetails {
    private let dataStore: QuoteDataStore = QuoteDataStore.shared
    
    func fetchQuote(with ticker: String) -> Quote? {
        let quote = self.dataStore.getQuote(with: ticker)
        return quote
    }
}
