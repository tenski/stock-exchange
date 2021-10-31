// Created by Алексей Тен on 11.10.2021.

import AlfaFoundation
import AlfaNetworking

protocol ProvidesShareholderList {
    func fetchShareholders() -> Promise<[Shareholder]>
}

final class ShareholderListProvider: ProvidesShareholderList {
    private let service: ModelService<[Shareholder]>
    private var dataStore: StoresShareholders

    init(service: ModelService<[Shareholder]>, dataStore: StoresShareholders) {
        self.service = service
        self.dataStore = dataStore
    }

    func fetchShareholders() -> Promise<[Shareholder]> {
        if let shareholders = dataStore.items {
            return Promise.value(shareholders)
        } else {
            return service.sendRequest().get { [weak self] in
                self?.dataStore.items = $0
            }
        }
    }
}
