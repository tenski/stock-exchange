//
//  Response.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.08.2021.
//

import Foundation

struct RawQuote: Codable {
    let id: Int
    let last: String
    let highestBid: String
    let percentChange: String
}

struct Quote {
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
