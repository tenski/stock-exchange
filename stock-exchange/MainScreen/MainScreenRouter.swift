//
//  Router.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import Foundation

class MainScreenRouter {
    weak var viewController: MainViewController?
    
    func openDetails(with quote: Quote) {
        let detailsController = DetailsViewController(with: quote)
        self.viewController?.navigationController?.pushViewController(detailsController, animated: true)
    }
}
