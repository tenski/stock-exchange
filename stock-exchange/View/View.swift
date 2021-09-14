//
//  CustomView.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import UIKit
import SnapKit

class View: UIView {
    
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTitle, lastTitle, highestTitle, percentTitle])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var logo_box = UIView()
    private lazy var my_title = UILabel()
    private lazy var header_box = UIView()
    private lazy var header_label = UILabel()
    
    private lazy var nameTitle: CustomLabel = {
        /*nameTitle.text = "Currancy pair"
        lastTitle.text = "last"
        highestTitle.text = "highestBid"
        percentTitle.text = "percentChange"*/
        CustomLabel()
    }()
    
    private lazy var lastTitle = CustomLabel()
    private lazy var highestTitle = CustomLabel()
    private lazy var percentTitle = CustomLabel()
    private lazy var titlesBox = UIView()
    
    init(tableManager: UITableViewDelegate & UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        add(subviews: headerStackView, tableView, logo_box, my_title, header_box, header_label, titlesBox)
        
        headerStackView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        
    }
}

extension UIView {
    func add(subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
        }
    }
}
