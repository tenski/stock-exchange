//
//  Interactor.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

protocol InteractorBusinessLogic {
    func loadData()
}

class Interactor: InteractorBusinessLogic {
    
    private let presenter: PresentationLogic
    private let provider: Provider
    
    init(presenter: PresentationLogic, provider: Provider) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func loadData() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            
            self?.provider.loadData() { [weak self] (fetch) in
                guard let self = self else { return }
                
                switch fetch {
                case .success(let data):
                    self.presenter.presentData(response: data)
                    
                case .failure(let error):
                    self.presenter.presentError(error)
                }
            }
        }
    }
}
