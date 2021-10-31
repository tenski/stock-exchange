// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaFoundation

protocol ManagingShareholderListTable: UITableViewDataSource, UITableViewDelegate {
    var viewModel: ShareholderListDataFlow.ViewModel? { get set }
}

class ShareholderListTableManager: NSObject, ManagingShareholderListTable {
    var viewModel: ShareholderListDataFlow.ViewModel?

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModel?.content.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let content = viewModel?.content[indexPath.row] else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCellWithAutoregistration(ContactCell.self) else { return UITableViewCell() }
        cell.configure(with: content)
        return cell
    }
}
