//
//  CollectionManager.swift
//  stock-exchange
//
//  Created by Алексей Тен on 21.09.2021.
//

import Foundation
import UIKit

protocol MainCollectionManaging: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var quotes: [Quote]? { get set }
}

protocol MainCollectionManagerDelegate: AnyObject {
    func didSelectQuote(with ticker: String)
}

class MainCollectionManager: NSObject, MainCollectionManaging {
    var quotes: [Quote]?
    weak var delegate: MainCollectionManagerDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quotes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier,
                                                            for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell()}
        
        if let quote = quotes?[indexPath.row] {
            cell.configure(quote: quote)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let quote = quotes?[indexPath.row] else { return }
        let ticker = quote.ticker
        delegate?.didSelectQuote(with: ticker)
    }
}
