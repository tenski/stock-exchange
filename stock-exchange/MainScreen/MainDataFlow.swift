//
//  DataFlow.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

enum MainDataFlow {
    struct Request { }
    
    typealias Response = [Quote]
    
    struct ViewModel {
        let content: [Content]
    }
    
    enum Content {
        case collection([Quote])
        case table(Quote)
    }
}

struct RawQuote: Codable {
    let id: Int
    let last: String
    let highestBid: String
    let percentChange: String
}

struct Quote: Codable {
    let ticker: String
    let id: Int
    let last: String
    let highestBid: String
    let percentChange: String
    
    init(ticker: String, rawQuote: RawQuote) {
        self.ticker = ticker
        id = rawQuote.id
        last = rawQuote.last
        highestBid = rawQuote.highestBid
        percentChange = rawQuote.percentChange
    }
}
