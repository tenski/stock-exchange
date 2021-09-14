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
        return viewModel?.quotes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        if let quote = viewModel?.quotes[indexPath.row] {
            cell.configure(quote: quote)
        }
        return cell
        
    }
}
