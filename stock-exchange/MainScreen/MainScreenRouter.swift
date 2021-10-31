//
//  Router.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import Foundation

protocol RoutesMainScreen {
    func openDetails(with ticker: String)
}

class MainScreenRouter: RoutesMainScreen {
    weak var viewController: MainViewController?
    
    func openDetails(with ticker: String) {
        let provider = DetailsProvider()
        let presenter = DetailsPresenter()
        let interactor = DetailsInteractor(presenter: presenter, provider: provider)
        let detailsViewController = DetailsViewController(interactor: interactor, ticker: ticker)
        
        presenter.viewController = detailsViewController
        
        self.viewController?.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
