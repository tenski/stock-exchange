// Created by Алексей Тен on 12.10.2021.

import AlfaFoundation
import AlfaNetworking
import TestAdditions

@testable import Shareholders

final class ShareholderListFactoryTests: QuickSpec {
    override func spec() {
        var factory: ShareholderListFactory!

        beforeEach {
            factory = .init()
        }
        
        describe(".build") {
            it("should build module parts") {
                // when
                let viewController = factory.build(with: nil)
                // then
                let interactor: ShareholderListInteractor? = viewController["interactor"]
                let presenter: ShareholderListPresenter? = interactor?["presenter"]
                let tableManager: ShareholderListTableManager? = viewController["tableManager"]
                expect(interactor).toNot(beNil())
                expect(presenter).toNot(beNil())
                expect(viewController).toNot(beNil())
                expect(tableManager).toNot(beNil())
            }
            it("should set dependencies between module parts") {
                // when
                let viewController = factory.build(with: nil)
                // then
                let interactor: ShareholderListInteractor? = viewController["interactor"]
                let presenter: ShareholderListPresenter? = interactor?["presenter"]
                expect(presenter?.viewController).to(be(viewController))
                
            }
        }
        
        describe(".deinit") {
            it("should not leak") {
                // when
                let result = MemoryLeakTest {
                    factory.build(with: nil)
                }
                // then
                expect(result).toNot(leak())
            }
        }
        
        describe(".isViewLoaded") {
            it("should not call isViewLoaded") {
                // when
                let viewController = factory.build(with: nil)
                // then
                expect(viewController.isViewLoaded).to(beFalse())
            }
        }
    }
}

extension ShareholderListInteractor: PropertyReflectable { }
extension ShareholderListViewController: PropertyReflectable { }
