// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaFoundation
import Foundation

protocol ShareholderListPresentationLogic {
    /// Готовит вью-модель для отображения списка акционеров
    func presentData(response: ShareholderListDataFlow.Response)
    /// Готовит вью-модель для отображения ошибки
    func presentError(_ type: ShareholderListDataFlow.ErrorType)
}

class ShareholderListPresenter: ShareholderListPresentationLogic {
    weak var viewController: DisplaysShareholderListLogic?
    
    private let appearance = Appearance(); private struct Appearance: Theme, Grid { }

    func presentData(response: ShareholderListDataFlow.Response) {
        let content = response.map {
            ShareholderListDataFlow.Content(
                title: $0.name,
                subtitle: "\($0.company.rawValue) - \(money: $0.amount)",
                imageSource: .image(UIImage.assets.glyph_car_m.withRenderingMode(.alwaysTemplate).with(tintColor: .red))
            )
        }
        viewController?.displayData(viewModel: .init(content: content))
    }
    
    func presentError(_ type: ShareholderListDataFlow.ErrorType) {
        switch type {
        case .loadingError:
            let viewModel = DefaultEmptyViewModel(
                icon: .image(UIImage.assets.glyph_internetOff_m.withRenderingMode(.alwaysTemplate), options: nil),
                iconBackgroundColor: appearance.palette.backgroundSecondary,
                title: "Something went wrong...",
                subtitle: ""
            )
            viewController?.displayError(viewModel)
        }
    }
}
