// Created by Алексей Тен on 13.10.2021.

import ABUIComponents
import TestAdditions

@testable import Shareholders

final class ShareholderListViewSnapshots: QuickSpec {
    override func spec() {
        var containerView: UIView!
        var view: ShareholderListView!
        var tableManager: ShareholderListTableManager!

        beforeEach {
            containerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
            tableManager = .init()
            view = .init(tableManager: tableManager)
            containerView.addSubview(view)
            view.frame = containerView.frame
        }

        describe(".snapshot") {
            it("should have valid representation") {
                // when
                tableManager.viewModel = TestData.viewModel
                view.tableView.reloadData()
                // then
                expect(view).to(self.validateSnapshot("ShareholderListView_default"))
            }
        }
    }
}

extension ShareholderListViewSnapshots {
    enum TestData {
        static let viewModel = ShareholderListDataFlow.Seeds.model
    }
}
