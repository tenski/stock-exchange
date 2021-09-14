//
//  DataFlow.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

enum DataFlow {
    typealias Response = [String: RawQuote]
    
    struct ViewModel {
        let quotes: [Quote]
    }
}
