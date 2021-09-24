//
//  TableManager.swift
//  stock-exchange
//
//  Created by Алексей Тен on 14.09.2021.
//

import Foundation
import UIKit

protocol TableManaging: UITableViewDataSource, UITableViewDelegate {
    var viewModel: DataFlow.ViewModel? { get set }
}

class TableManager: NSObject, TableManaging {
    var viewModel: DataFlow.ViewModel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.content.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = viewModel?.content[indexPath.row] else {
            return UITableViewCell()
        }
        switch content {
        case .collection(let quotes):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier,
                                                           for: indexPath) as? CollectionTableViewCell else { return UITableViewCell()}
            cell.configure(quotes: quotes)
            return cell
        case .table(let quote):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AlphaTableViewCell.identifier,
                                                           for: indexPath) as? AlphaTableViewCell else { return UITableViewCell()}
            cell.configure(quote: quote)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
}
