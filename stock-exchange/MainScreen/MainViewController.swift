//
//  MainViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 23.08.2021.
//

import UIKit
import SnapKit

protocol DisplaysLogic: AnyObject {
    func displayData(viewModel: DataFlow.ViewModel)
}

class MainViewController: UIViewController, UITableViewDelegate {
    
    private let tableManager: TableManaging
    private let interactor: InteractorBusinessLogic
    private let router: MainScreenRouter
    private lazy var contentView = View(tableManager: tableManager)
    
    init(interactor: InteractorBusinessLogic, tableManager: TableManaging, router: MainScreenRouter) {
        self.interactor = interactor
        self.tableManager = tableManager
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        tableManager.delegate = self
        tableManager.collectionDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadData()
        
        let logoBox = LogoBox()
        navigationItem.titleView = logoBox
        navigationItem.titleView?.frame = .init(origin: .zero, size: logoBox.intrinsicContentSize)
    }
    
    override func loadView() {
        view = contentView
    }
}


extension MainViewController: DisplaysLogic {
    func displayData(viewModel: DataFlow.ViewModel) {
        self.tableManager.viewModel = viewModel
        self.contentView.tableView.reloadData()
    }
}

extension MainViewController: TableManagerDelegate, CollectionManagerDelegate {
    func didSelectQuote(with quote: Quote) {
        router.openDetails(with: quote)
    }
}
