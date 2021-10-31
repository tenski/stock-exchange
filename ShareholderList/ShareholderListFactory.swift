// Created by Алексей Тен on 12.10.2021.

import AlfaFoundation
import AlfaNetworking
import SharedRouter

class ShareholderListFactory: Factory {
    func build(with _: Any?) -> ShareholderListViewController {
        let service = AnyNetworkService(ShareholderService())
        let dataStore = ShareholderDataStore()
        let provider = ShareholderListProvider(service: service, dataStore: dataStore)
        let tableManager = ShareholderListTableManager()

        let presenter = ShareholderListPresenter()
        let interactor = ShareholderListInteractor(presenter: presenter, provider: provider)
        let viewController = ShareholderListViewController(interactor: interactor, tableManager: tableManager)

        presenter.viewController = viewController

        return viewController
    }
}
