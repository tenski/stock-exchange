// Created by Алексей Тен on 13.10.2021.

import ABUIComponents
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListViewControllerTests: QuickSpec {
    override func spec() {
        var tableViewMock: UITableViewMock!

        var interactorMock: ShareholderListBusinessLogicMock!
        var tableManagerMock: ManagingShareholderListTableMock!
        var viewController: ShareholderListViewController!

        var contentViewMock: DisplaysShareholderListViewMock!

        beforeEach {
            tableViewMock = .init()

            interactorMock = .init()
            tableManagerMock = .init()
            viewController = .init(
                interactor: interactorMock,
                tableManager: tableManagerMock
            )
            contentViewMock = .init()
            contentViewMock.showState(.waiting)
            viewController.contentView = contentViewMock
        }
        
        describe(".loadView") {
            it("should setup views") {
                // when
                viewController.loadView()
                // then
                expect(viewController.view).to(beIdenticalTo(contentViewMock))
            }
        }
        
        describe(".viewDidLoad") {
            it("should setup module") {
                // when
                viewController.loadViewIfNeeded()
                // then
                expect(contentViewMock).to(beWaitingState())
                expect(interactorMock.fetchDataWasCalled).to(beCalledOnce())
            }
        }
        
        describe(".displayData") {
            it("should call tableManager and update rows") {
                // given
                contentViewMock.tableView = tableViewMock
                // when
                viewController.displayData(viewModel: TestData.viewModel)
                // then
                expect(tableViewMock.reloadDataWasCalled).to(beCalledOnce())
            }
        }
        
        describe(".displayError") {
            it("should show empty state") {
                // when
                viewController.displayError(TestData.emptyViewModel)
                // then
                expect(contentViewMock).to(beEmptyState())
            }
        }
    }
}

private extension ShareholderListViewControllerTests {
    enum TestData {
        static let viewModel = ShareholderListDataFlow.Seeds.model
        static let emptyViewModel = DefaultEmptyViewModel(
            icon: .image(
                UIImage.assets.glyph_internetOff_m.withRenderingMode(.alwaysTemplate),
                options: nil),
            iconBackgroundColor: .white,
            title: "Что-то пошло не так...",
            subtitle: ""
        )
    }
}
