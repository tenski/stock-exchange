//
//  TableManager.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation
import UIKit

protocol MainTableManaging: UITableViewDataSource, UITableViewDelegate {
    var viewModel: MainDataFlow.ViewModel? { get set }
    var delegate: MainTableManagerDelegate? { get set }
    var collectionDelegate: MainCollectionManagerDelegate? { get set }
}

protocol MainTableManagerDelegate: AnyObject {
    func didSelectQuote(with ticker: String)
}

class MainTableManager: NSObject, MainTableManaging {
    var viewModel: MainDataFlow.ViewModel?
    weak var delegate: MainTableManagerDelegate?
    weak var collectionDelegate: MainCollectionManagerDelegate?
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel?.content.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = viewModel?.content[indexPath.row] else {
            return UITableViewCell()
        }
        switch content {
        case .collection(let quotes):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCollectionTableViewCell.identifier,
                                                           for: indexPath) as? MainCollectionTableViewCell else { return UITableViewCell()}
            cell.configure(quotes: quotes)
            cell.selectionStyle = .none
            cell.collectionManager.delegate = collectionDelegate
            return cell
        case .table(let quote):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
                                                           for: indexPath) as? MainTableViewCell else { return UITableViewCell()}
            cell.configure(quote: quote)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let content = viewModel?.content[indexPath.row] else {
            return UITableView.automaticDimension
        }
        switch content {
        case .collection:
            return 90
        case .table:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let content = viewModel?.content[indexPath.row] else { return }
        
        switch content {
        case .table(let quote):
            let ticker = quote.ticker
            delegate?.didSelectQuote(with: ticker)
        case .collection: break
        }
    }
}
