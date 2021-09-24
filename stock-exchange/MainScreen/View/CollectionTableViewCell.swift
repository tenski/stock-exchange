//
//  CollectionTableViewCell.swift
//  stock-exchange
//
//  Created by Алексей Тен on 23.09.2021.
//

import UIKit



class CollectionTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionTableViewCell"
    
    let collectionManager = CollectionManager()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 90)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewsAndConstraints()
        collectionView.delegate = collectionManager
        collectionView.dataSource = collectionManager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
        
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(quotes: [Quote]) {
        collectionManager.quotes = quotes
        collectionView.reloadData()
    }
}
