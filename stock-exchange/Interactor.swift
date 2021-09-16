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
    
    init(presenter: PresentationLogic) {
        self.presenter = presenter
    }
    
    func loadData() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            
            self?.presenter.loadData() { [weak self] (fetch) in
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
