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
}

class Presenter: PresentationLogic {
    
    weak var viewController: DisplaysLogic?
    
    func presentData(response: DataFlow.Response) {
        let quotes = response.map {
            Quote(ticker: $0.key, rawQuote: $0.value)
        }
        
        viewController?.displayData(viewModel: .init(quotes: quotes))
    }
    
    func presentError(_ error: Error) {
        
    }
}
