//
//  Factory.swift
//  stock-exchange
//
//  Created by Алексей Тен on 15.09.2021.
//

import Foundation

class Factory {
    static func build() -> ViewController {
        let dataFetcher = NetworkDataFetcher()
        let presenter = Presenter()
        let interactor = Interactor(dataFetcher: dataFetcher, presenter: presenter)
        let viewController = ViewController(interactor: interactor, tableManager: TableManager())
        presenter.viewController = viewController
        
        return viewController
    }
}
