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
    private lazy var contentView = View(tableManager: tableManager)
    
    init(interactor: InteractorBusinessLogic, tableManager: TableManaging) {
        self.interactor = interactor
        self.tableManager = tableManager
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor.loadData()
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
