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
        let box = UIView()
        box.backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.2745098039, blue: 0.2, alpha: 1)
        return box
    }()
    private lazy var tenskiTitle: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Stock Market\n by tenski"
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AlphaTableViewCell.self, forCellReuseIdentifier: AlphaTableViewCell.identifier)
        return tableView
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
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
        
        add(subviews: logoBox, tableView)
        
        logoBox.add(subviews: tenskiTitle)
        logoBox.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        tenskiTitle.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(logoBox.snp.bottom)
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
