//
//  MainViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 23.08.2021.
//

import UIKit
import SnapKit

protocol MainDisplaysLogic: AnyObject {
    func displayData(viewModel: MainDataFlow.ViewModel)
}

class MainViewController: UIViewController, UITableViewDelegate {
    private let tableManager: MainTableManaging
    private let interactor: MainBusinessLogic
    private let router: RoutesMainScreen
    private lazy var contentView = MainView(tableManager: tableManager)
    
    init(interactor: MainBusinessLogic, tableManager: MainTableManaging, router: RoutesMainScreen) {
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
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoBox = LogoBox()
        navigationItem.titleView = logoBox
        navigationItem.titleView?.frame = .init(origin: .zero, size: logoBox.intrinsicContentSize)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        interactor.stopTimer()
    }
}


extension MainViewController: MainDisplaysLogic {
    func displayData(viewModel: MainDataFlow.ViewModel) {
        self.tableManager.viewModel = viewModel
        self.contentView.tableView.reloadData()
    }
}

extension MainViewController: MainTableManagerDelegate, MainCollectionManagerDelegate {
    func didSelectQuote(with ticker: String) {
        router.openDetails(with: ticker)
    }
}
