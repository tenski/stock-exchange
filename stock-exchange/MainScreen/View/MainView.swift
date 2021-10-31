//
//  CustomView.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import UIKit
import SnapKit

class MainView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self,
                           forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.register(MainCollectionTableViewCell.self,
                           forCellReuseIdentifier: MainCollectionTableViewCell.identifier)
        return tableView
    }()
    
    init(tableManager: UITableViewDelegate & UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainView {
    func setupViewsAndConstraints() {
        backgroundColor = .white
        add(subviews: tableView)
        
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
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
