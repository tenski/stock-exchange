// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaFoundation
import Foundation

protocol DisplaysShareholderListLogic: AnyObject {
    /// Отображает список акционеров
    func displayData(viewModel: ShareholderListDataFlow.ViewModel)
    /// Отображает состояние ошибок
    func displayError(_ viewModel: DefaultEmptyViewModel)
}

public class ShareholderListViewController: UIViewController {
    private let interactor: ShareholderListBusinessLogic
    private let tableManager: ManagingShareholderListTable
    lazy var contentView: DisplaysShareholderListView = ShareholderListView(tableManager: tableManager)
    
    init(interactor: ShareholderListBusinessLogic, tableManager: ManagingShareholderListTable) {
        self.interactor = interactor
        self.tableManager = tableManager
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = contentView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        contentView.showState(.waiting)
        interactor.fetchData()
    }
}

// MARK: - DisplaysShareholderListLogic

extension ShareholderListViewController: DisplaysShareholderListLogic {
    func displayData(viewModel: ShareholderListDataFlow.ViewModel) {
        tableManager.viewModel = viewModel
        contentView.tableView.reloadData()
        contentView.showState(.default)
    }
    
    func displayError(_ viewModel: DefaultEmptyViewModel) {
        contentView.showState(.empty(viewModel))
    }
}
