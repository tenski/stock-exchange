//
//  Response.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.08.2021.
//

import Foundation

struct Quote: Codable {
    let id: Int
    let last: String
    let highestBid: String
    let percentChange: String
}

typealias SearchResponse = [String: Quote]
