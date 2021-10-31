// Created by Алексей Тен on 14.10.2021.

import ABUIComponents
import AlfaFoundation
import TestAdditions

@testable import Shareholders

final class ShareholderListPresenterTests: QuickSpec {
    override func spec() {
        var presenter: ShareholderListPresenter!
        var viewControllerMock: DisplaysShareholderListLogicMock!
        
        beforeEach {
            presenter = .init()
            viewControllerMock = .init()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentData") {
            context("successfull result") {
                it("should prepare result view model and display it in view") {
                    // when
                    presenter.presentData(response: TestData.successfullResponse)
                    // then
                    expect(viewControllerMock.displayDataViewModelWasCalled).to(beCalledOnce())
                    expect(viewControllerMock.displayDataViewModelReceivedViewModel).to(equal(TestData.viewModel))
                    expect(viewControllerMock.displayErrorWasCalled).toEventuallyNot(beCalled())
                    expect(viewControllerMock.displayErrorReceivedViewModel).to(beNil())
                }
            }
        }
        
        describe(".presentError") {
            context("failed result") {
                it("should prepare an empty view model and display it in view") {
                    // when
                    presenter.presentError(TestData.failedResponse)
                    // then
                    expect(viewControllerMock.displayErrorWasCalled).to(beCalledOnce())
                    expect(viewControllerMock.displayErrorReceivedViewModel).to(equal(TestData.emptyViewModel))
                    expect(viewControllerMock.displayDataViewModelWasCalled).toEventuallyNot(beCalled())
                    expect(viewControllerMock.displayDataViewModelReceivedViewModel).to(beNil())
                }
            }
        }
    }
}

extension ShareholderListPresenterTests {
    enum TestData {
        static let appearance = Appearance(); struct Appearance: Theme, Grid { }
        
        static let content = ShareholderListDataFlow.Content(
            title: TestData.successfullResponse[0].name,
            subtitle: "\(TestData.successfullResponse[0].company.rawValue) - \(TestData.successfullResponse[0].amount.value) \(TestData.successfullResponse[0].amount.currency.symbol)",
            imageSource: .image(UIImage.assets.glyph_car_m.withRenderingMode(.alwaysTemplate).with(tintColor: .red))
        )
        static let viewModel = ShareholderListDataFlow.ViewModel.init(content: [content])
        static let successfullResponse = [Shareholder.Seeds.model]
        
        static let emptyViewModel = DefaultEmptyViewModel(
            icon: .image(UIImage.assets.glyph_internetOff_m.withRenderingMode(.alwaysTemplate), options: nil),
            iconBackgroundColor: appearance.palette.backgroundSecondary,
            title: "Something went wrong...",
            subtitle: ""
        )
        static let failedResponse = ShareholderListDataFlow.ErrorType.loadingError("test failed")
    }
}
