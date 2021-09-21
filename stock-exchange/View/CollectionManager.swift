//
//  CollectionManager.swift
//  stock-exchange
//
//  Created by Алексей Тен on 21.09.2021.
//

import Foundation
import UIKit

protocol CollectionManaging: UICollectionViewDataSource, UICollectionViewDelegate {
    var viewModel: DataFlow.ViewModel? { get set }
}

class CollectionManager: NSObject, CollectionManaging {
    var viewModel: DataFlow.ViewModel?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        
        if let quote = viewModel?[indexPath.row] {
            cell.configure(quote: quote)
        }
        return cell
    }
}
