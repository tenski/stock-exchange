// Created by Алексей Тен on 13.10.2021.

extension ShareholderListDataFlow {
    enum Seeds {
        static let model = ShareholderListDataFlow.ViewModel(
            content: [
                ShareholderListDataFlow.Content.init(
                    title: "Oleg Tinkoff",
                    subtitle: "Tinkoff - 3228",
                    imageSource: .image(
                        UIImage.assets.glyph_car_m,
                        options: nil
                    )
                )
            ]
        )
    }
}
