//
//  CollectionManager.swift
//  stock-exchange
//
//  Created by Алексей Тен on 21.09.2021.
//

import Foundation
import UIKit

protocol CollectionManaging: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var quotes: [Quote]? { get set }
}

protocol CollectionManagerDelegate: AnyObject {
    func didSelectQuote(with quote: Quote)
}

class CollectionManager: NSObject, CollectionManaging {
    
    var quotes: [Quote]?
    weak var delegate: CollectionManagerDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                            for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        
        if let quote = quotes?[indexPath.row] {
            cell.configure(quote: quote)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let quote = quotes?[indexPath.row] else { return }
        
        delegate?.didSelectQuote(with: quote)
    }
}
