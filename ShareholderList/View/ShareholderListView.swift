// Created by Алексей Тен on 12.10.2021.

import ABUIComponents
import AlfaFoundation
import SnapKit

protocol DisplaysShareholderListView: UIView, DisplaysDefaultContentState {
    var tableView: UITableView { get }
}

class ShareholderListView: UIView {
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()

    init(tableManager: UITableViewDelegate & UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = tableManager
        tableView.dataSource = tableManager
        setupViewsAndConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewsAndConstraints() {
        add(subviews: tableView)

        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

extension ShareholderListView: DisplaysShareholderListView, DisplaysDefaultContentState, DisplaysContentStateTrait { }
