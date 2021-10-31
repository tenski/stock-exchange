// Created by Алексей Тен on 14.10.2021.

import AlfaFoundation
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListInteractorTests: QuickSpec {
    override func spec() {
        var interactor: ShareholderListInteractor!
        var presenterMock: ShareholderListPresentationLogicMock!
        var providerMock: ProvidesShareholderListMock!
        
        beforeEach {
            presenterMock = .init()
            providerMock = .init()
            interactor = .init(presenter: presenterMock, provider: providerMock)
        }
        
        describe(".fetchData") {
            it("should get data from provider") {
                // given
                providerMock.fetchShareholdersStub = TestData.promise
                // when
                interactor.fetchData()
                // then
                expect(providerMock.fetchShareholdersWasCalled).to(beCalledOnce())
            }
            context("fetchShareholders successful") {
                it("should prepare success response and call presenter") {
                    // given
                    providerMock.fetchShareholdersStub = TestData.promise
                    // when
                    interactor.fetchData()
                    // then
                    expect(presenterMock.presentDataResponseWasCalled).toEventually(beCalledOnce())
                    expect(presenterMock.presentDataResponseReceivedResponse).toEventually(equal(TestData.shareholders))
                    expect(presenterMock.presentErrorWasCalled).toNot(beCalled())
                }
            }
            context("fetchShareholders failed") {
                it("should prepare failed response and call presenter") {
                    // given
                    providerMock.fetchShareholdersStub = .init(error: TestData.error)
                    // when
                    interactor.fetchData()
                    // then
                    expect(presenterMock.presentErrorWasCalled).toEventually(beCalledOnce())
                    expect(presenterMock.presentDataResponseWasCalled).toEventuallyNot(beCalled())
                    expect(presenterMock.presentDataResponseReceivedResponse).toEventually(beNil())
                }
            }
        }
    }
}

extension ShareholderListInteractorTests {
    enum TestData {
        static let shareholders = [Shareholder.Seeds.model]
        static let promise = Promise.value(shareholders)
        static let error = ServiceError.other
    }
}
