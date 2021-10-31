// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaFoundation

enum ShareholderListDataFlow {
    struct Request { }
    
    typealias Response = [Shareholder]
    
    struct ViewModel: Equatable {
        let content: [Content]
    }

    struct Content: Equatable {
        let title: String
        let subtitle: String
        let imageSource: ImageSource
    }
    
    enum ErrorType: Error {
        case loadingError(String)
    }
}

// MARK: - ShareholderListDataFlow.Content + ContactCellViewModel

extension ShareholderListDataFlow.Content: ContactCellViewModel {
    var name: String {
        title
    }
    
    var phone: String? {
        subtitle
    }
}
