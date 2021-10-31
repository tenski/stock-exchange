//
//  Interactor.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation

protocol MainBusinessLogic {
    func loadData()
    func stopTimer()
}

class MainInteractor: MainBusinessLogic {
    private let presenter: MainPresentationLogic
    private let provider: ProvidesMain
    private var timer: Timer?
    
    init(presenter: MainPresentationLogic, provider: ProvidesMain) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func loadData() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.provider.fetchQuotes { [weak self] (fetch) in
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
    
    func stopTimer() {
        timer?.invalidate()
    }
}
