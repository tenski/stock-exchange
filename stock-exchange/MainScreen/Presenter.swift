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
        let quotes: [Quote] = response
        let collection: [DataFlow.Content] = [.collection(quotes)]
        
        let table = response.map {
            return DataFlow.Content.table($0)
        }
        
        let viewModel = DataFlow.ViewModel.init(content: collection + table)
        viewController?.displayData(viewModel: viewModel)
    }
    
    func presentError(_ error: Error) {
        
    }
}
