//
//  DetailsPresenter.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import Foundation

protocol DetailsPresentationLogic {
    func presentData(response: DetailsDataFlow.Response)
}

class DetailsPresenter: DetailsPresentationLogic {
    weak var viewController: DisplaysDetailsLogic?
    
    func presentData(response: DetailsDataFlow.Response) {
        let viewModel: DetailsDataFlow.ViewModel = response
        viewController?.displayData(viewModel: viewModel)
    }
}
