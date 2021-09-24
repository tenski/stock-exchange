//
//  DataFlow.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

//enum DataFlow {
//    typealias Response = [Quote]
//    enum ViewModel {
//        case collection([Quote])
//        case table([Quote])
//    }
//}

enum DataFlow {
    typealias Response = [Quote]
    
    struct ViewModel {
        let content: [Content]
    }
    
    enum Content {
        case collection([Quote])
        case table(Quote)
    }
}
