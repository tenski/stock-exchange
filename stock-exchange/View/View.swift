//
//  CustomView.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import UIKit
import SnapKit

class View: UIView {
    
    private lazy var logoBox: UIView = {
        let logoBox = UIView()
        logoBox.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        return logoBox
    }()
    
    private lazy var tenskiTitle: UILabel = {
        let tenskiTitle = UILabel()
        tenskiTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tenskiTitle.numberOfLines = 2
        tenskiTitle.textAlignment = .center
        tenskiTitle.text = "Stock Market\n by tenski"
        tenskiTitle.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        return tenskiTitle
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTitle, lastTitle, highestTitle, percentTitle])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        //stackView.alignment = .leading
        return stackView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var nameTitle: CustomLabel = {
        let nameTitle = CustomLabel()
        nameTitle.text = "Currency pair"
        //nameTitle.textAlignment = .left
        return nameTitle
    }()
    private lazy var lastTitle: CustomLabel = {
        let lastTitle = CustomLabel()
        lastTitle.text = "last"
        //lastTitle.textAlignment = .left
        return lastTitle
    }()
    private lazy var highestTitle: CustomLabel = {
        let highestTitle = CustomLabel()
        highestTitle.text = "highestBid"
        //highestTitle.textAlignment = .left
        return highestTitle
    }()
    private lazy var percentTitle : CustomLabel = {
        let percentTitle = CustomLabel()
        percentTitle.text = "percentChange"
        //percentTitle.textAlignment = .left
        return percentTitle
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
    
    private func setupViewsAndConstraints() {
        backgroundColor = .white
        
        add(subviews: logoBox, headerStackView, tableView)
        
        logoBox.add(subviews: tenskiTitle)
        
        logoBox.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        tenskiTitle.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        headerStackView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(16)
            $0.top.equalTo(logoBox.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(16)
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
