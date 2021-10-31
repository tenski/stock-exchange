//
//  DataStore.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import Foundation

protocol StoresQuotes {
    var items: [String: Quote] { get set }
    func saveQuotes(with quotes: [Quote])
    func getQuote(with ticker: String) -> Quote?
}

class QuoteDataStore: StoresQuotes {
    static var shared = QuoteDataStore()
    var items: [String: Quote] = [:]
    
    func saveQuotes(with quotes: [Quote]) {
        quotes.forEach {
            self.items[$0.ticker] = $0
        }
    }
    
    func getQuote(with ticker: String) -> Quote? {
        return items[ticker]
    }
}
