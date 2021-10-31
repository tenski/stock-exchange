//
//  DetailsViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import UIKit

protocol DisplaysDetailsLogic: AnyObject {
    func displayData(viewModel: DetailsDataFlow.ViewModel)
}

class DetailsViewController: UIViewController {
    private let interactor: DetailsBusinessLogic
    var ticker: String
    
    private let contentView = DetailsView()
    
    init(interactor: DetailsBusinessLogic, ticker: String) {
        self.interactor = interactor
        self.ticker = ticker
        super.init(nibName: nil, bundle: nil)
        title = ticker
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        interactor.loadData(with: ticker)
    }
}

extension DetailsViewController: DisplaysDetailsLogic {
    func displayData(viewModel: DetailsDataFlow.ViewModel) {
        contentView.configure(with: viewModel)
    }
}
