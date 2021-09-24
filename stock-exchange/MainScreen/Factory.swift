//
//  Factory.swift
//  stock-exchange
//
//  Created by Алексей Тен on 15.09.2021.
//

import Foundation

class Factory {
    static func build() -> MainViewController {
        let provider = Provider()
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter, provider: provider)
        
        let viewController = MainViewController(interactor: interactor, tableManager: TableManager())
        presenter.viewController = viewController
        
        return viewController
    }
}
