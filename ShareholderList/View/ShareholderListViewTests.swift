// Created by Алексей Тен on 13.10.2021.

import ABUIComponents
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListViewTests: QuickSpec {
    override func spec() {
        var view: ShareholderListView!

        describe(".init") {
            it("should set correct dependencies ") {
                // given
                let tableManager = ShareholderListTableManager()
                view = .init(tableManager: tableManager)
                // then
                expect(view.tableView.dataSource).to(be(tableManager))
                expect(view.tableView.delegate).to(be(tableManager))
            }
        }
    }
}
