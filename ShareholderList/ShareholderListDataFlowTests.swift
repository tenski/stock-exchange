// Created by Алексей Тен on 13.10.2021.

import ABUIComponents
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListDataFlowTests: QuickSpec {
    override func spec() {
        describe(".content") {
            it("should conform to protocol 'ContactCellViewModel'") {
                // when
                let viewModel = ShareholderListDataFlow.ViewModel(content: TestData.content)
                let testIndex: Int = 0
                // then
                expect(viewModel.content[testIndex].name).to(equal(TestData.content[testIndex].title))
                expect(viewModel.content[testIndex].phone).to(equal(TestData.content[testIndex].subtitle))
            }
        }
    }
}

extension ShareholderListDataFlowTests {
    enum TestData {
        static let content = [
            ShareholderListDataFlow.Content(
                title: "Alex Ten",
                subtitle: "Alfa-bank",
                imageSource: .image(
                    UIImage.assets.art_logoAlfa_color
                )
            )
        ]
    }
}
