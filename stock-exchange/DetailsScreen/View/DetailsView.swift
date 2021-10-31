//
//  DetailsView.swift
//  stock-exchange
//
//  Created by Алексей Тен on 29.09.2021.
//

import Foundation
import UIKit
import SnapKit

protocol DisplaysDetailsView {
    func configure(with quote: Quote)
}

class DetailsView: UIView {
    private lazy var quoteView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 3
        view.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.2745098174, blue: 0.2, alpha: 1)
        return view
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tickerHeader, lastHeader, percentHeader])
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    private lazy var tickerHeader: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 16)
        label.text = "Ticker:"
        return label
    }()
    private lazy var lastHeader: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 16)
        label.text = "Last bid:"
        return label
    }()
    private lazy var percentHeader: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 16)
        label.text = "Percent change:"
        return label
    }()
    
    private lazy var quoteStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tickerLabel, lastLabel, percentLabel])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .bottom
        return stackView
    }()
    private lazy var tickerLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 16)
        return label
    }()
    private lazy var lastLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 16)
        return label
    }()
    private lazy var percentLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.2320765403, green: 0.7523497375, blue: 0.1363231083, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 16)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView: DisplaysDetailsView {
    func configure(with quote: Quote) {
        tickerLabel.text = quote.ticker
        lastLabel.text = quote.last
        
        let doublePercent = (Double(quote.percentChange) ?? 00)*100
        percentLabel.text = "\(Double(round(100*doublePercent)/100))%"
    }
}

private extension DetailsView {
    func setupViewsAndConstraints() {
        backgroundColor = .white
        add(subviews: quoteView, headerStackView, quoteStackView)
        
        quoteView.snp.makeConstraints {
            $0.left.right.top.equalTo(safeAreaLayoutGuide).inset(50).priority(.high)
            $0.bottom.equalTo(headerStackView.snp.bottom).offset(20)
        }
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(quoteView.snp.top).inset(20)
            $0.left.equalTo(quoteView.snp.left).inset(20)
        }
        quoteStackView.snp.makeConstraints {
            $0.top.equalTo(quoteView.snp.top).inset(20)
            $0.right.equalTo(quoteView.snp.right).inset(20)
            $0.bottom.equalTo(headerStackView.snp.bottom)
        }
    }
}
