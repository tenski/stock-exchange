// Created by Алексей Тен on 11.10.2021.

import AlfaFoundation
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListProviderTests: QuickSpec {
    override func spec() {
        var shareholderListProvider: ShareholderListProvider!
        var serviceMock: ModelNetworkServiceMock<[Shareholder]>!
        var dataStoreMock: StoresShareholdersMock!

        beforeEach {
            dataStoreMock = .init()
            serviceMock = .init()
            shareholderListProvider = .init(service: serviceMock, dataStore: dataStoreMock)
        }
        
        describe(".fetchShareholders") {
            context("when dataStore is empty") {
                it("should succeed response") {
                    // given
                    serviceMock.sendRequestCompletionStub = .success(TestData.shareholders)
                    // when
                    let result = shareholderListProvider.fetchShareholders()
                    // then
                    expect(result.value).toEventually(equal(TestData.shareholders))
                    expect(serviceMock.sendRequestWasCalled).to(beCalledOnce())
                    expect(dataStoreMock.setItemsWasCalled).toEventually(beCalledOnce())
                    expect(dataStoreMock.getItemsWasCalled).to(beCalledOnce())
                    expect(dataStoreMock.items).toEventually(equal(TestData.shareholders))
                }
                it("should fail response") {
                    // given
                    serviceMock.sendRequestCompletionStub = .failure(TestData.error)
                    // when
                    let result = shareholderListProvider.fetchShareholders()
                    // then
                    expect(result.error).to(matchError(TestData.error))
                    expect(dataStoreMock.getItemsWasCalled).to(beCalledOnce())
                }
            }
            context("when dataStore is fullfilled") {
                it("should not call service") {
                    // given
                    dataStoreMock.items = TestData.shareholders
                    // when
                    let result = shareholderListProvider.fetchShareholders()
                    // then
                    expect(result.value).to(equal(TestData.shareholders))
                    expect(serviceMock.sendRequestWasCalled).notTo(beCalled())
                    expect(dataStoreMock.getItemsWasCalled).to(beCalledOnce())
                }
            }
        }
    }
}

private extension ShareholderListProviderTests {
    enum TestData {
        static let shareholders = [Shareholder.Seeds.model]
        static let error = ServiceError.other
    }
}
