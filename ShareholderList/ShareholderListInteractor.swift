// Created by Алексей Тен on 12.10.2021.

import AlfaFoundation

protocol ShareholderListBusinessLogic {
    func fetchData()
}

class ShareholderListInteractor: ShareholderListBusinessLogic {
    private let presenter: ShareholderListPresentationLogic
    private let provider: ProvidesShareholderList

    init(presenter: ShareholderListPresentationLogic, provider: ProvidesShareholderList) {
        self.presenter = presenter
        self.provider = provider
    }
    
    func fetchData() {
        firstly {
            provider.fetchShareholders()
        }.done { [weak self] response in
            self?.presenter.presentData(response: response)
        }.catch { [weak self] error in
            let errorDescription = error.localizedDescription
            self?.presenter.presentError(.loadingError(errorDescription))
        }
    }
}
