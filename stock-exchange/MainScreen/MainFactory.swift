//
//  Factory.swift
//  stock-exchange
//
//  Created by Алексей Тен on 15.09.2021.
//

import Foundation

class MainFactory {
    static func build() -> MainViewController {
        let provider = MainProvider()
        let router = MainScreenRouter()
        
        let presenter = MainPresenter()
        let interactor = MainInteractor(presenter: presenter, provider: provider)
        let viewController = MainViewController(interactor: interactor, tableManager: MainTableManager(), router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
