//
//  Presenter.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

protocol MainPresentationLogic {
    func presentData(response: MainDataFlow.Response)
    func presentError(_ error: Error)
}

class MainPresenter: MainPresentationLogic {
    weak var viewController: MainDisplaysLogic?
    
    func presentData(response: MainDataFlow.Response) {
        let quotes: [Quote] = response
        let collection: [MainDataFlow.Content] = [.collection(quotes)]
        
        let table = response.map {
            return MainDataFlow.Content.table($0)
        }
        
        let viewModel = MainDataFlow.ViewModel.init(content: collection + table)
        viewController?.displayData(viewModel: viewModel)
    }
    
    func presentError(_ error: Error) {
        
    }
}
