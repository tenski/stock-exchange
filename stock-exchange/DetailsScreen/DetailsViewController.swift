//
//  DetailsViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 24.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    init(with quote: Quote) {
        super.init(nibName: nil, bundle: nil)
        title = quote.ticker
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
}
