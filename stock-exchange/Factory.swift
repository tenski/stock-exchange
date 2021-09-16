//
//  Factory.swift
//  stock-exchange
//
//  Created by Алексей Тен on 15.09.2021.
//

import Foundation

class Factory {
    static func build() -> ViewController {
        let provider = Provider()
        let presenter = Presenter(provider: provider)
        let interactor = Interactor(presenter: presenter)
        
        let viewController = ViewController(interactor: interactor, tableManager: TableManager())
        presenter.viewController = viewController
        
        return viewController
    }
}
