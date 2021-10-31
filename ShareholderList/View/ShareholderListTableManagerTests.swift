// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListTableManagerTests: QuickSpec {
    override func spec() {
        var tableManager: ShareholderListTableManager!
        var tableViewMock: UITableViewMock!

        beforeEach {
            tableViewMock = .init()
            tableManager = .init()
        }
        
        describe(".tableViewNumberOfRowsInSection") {
            it("should return number of rows") {
                // given
                tableManager.viewModel = TestData.viewModel
                // when
                let result = tableManager.tableView(tableViewMock, numberOfRowsInSection: TestData.indexPath.section)
                // then
                expect(result).to(equal(TestData.viewModel.content.count))
            }
            it("should return zero") {
                // when
                let result = tableManager.tableView(tableViewMock, numberOfRowsInSection: TestData.indexPath.section)
                // then
                expect(result).to(equal(.zero))
            }
        }
        
        describe(".tableViewCellForRowAt") {
            it("should return ContactCell") {
                // given
                let expectedCellType = ContactCell.self
                let cell = expectedCellType.init()
                tableViewMock.dequeueReusableCellWithIdentifierStub = cell
                tableManager.viewModel = TestData.viewModel
                // when
                let result = tableManager.tableView(tableViewMock, cellForRowAt: TestData.indexPath)
                // then
                expect(result).to(beAKindOf(expectedCellType))
            }
            it("should return UITableViewCell") {
                // given
                let expectedCellType = UITableViewCell.self
                let cell = expectedCellType.init()
                tableViewMock.dequeueReusableCellWithIdentifierStub = cell
                // when
                let result = tableManager.tableView(tableViewMock, cellForRowAt: TestData.indexPath)
                // then
                expect(result).to(beAKindOf(UITableViewCell.self))
            }
        }
    }
}

private extension ShareholderListTableManagerTests {
    enum TestData {
        static let indexPath = IndexPath(row: 0, section: 0)
        static let viewModel = ShareholderListDataFlow.Seeds.model
    }
}
