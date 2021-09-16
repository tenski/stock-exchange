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
        viewController?.displayData(viewModel: response)
    }
    
    func presentError(_ error: Error) {
        
    }
}
