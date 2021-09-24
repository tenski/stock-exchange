//
//  AlphaTableViewCell.swift
//  stock-exchange
//
//  Created by Алексей Тен on 16.09.2021.
//

import UIKit

class AlphaTableViewCell: UITableViewCell {

    static let identifier = "AlphaTableViewCell"
    
    private lazy var lastAndPercentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastLabel, percentLabel])
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        return stackView
    }()
    private var tickerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "alpha")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private var tickerLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 14)
        return label
    }()
    private var lastLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return label
    }()
    private var percentLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.2320765403, green: 0.7523497375, blue: 0.1363231083, alpha: 1)
        label.textAlignment = .right
        label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsAndConstraints() {
            contentView.add(subviews: tickerImageView, tickerLabel, lastAndPercentStackView)
            
            tickerImageView.snp.makeConstraints {
                $0.top.left.equalToSuperview().inset(10)
                $0.width.height.equalTo(40)
            }
            tickerLabel.snp.makeConstraints {
                $0.top.equalToSuperview().inset(10)
                $0.left.equalTo(tickerImageView.snp.right).offset(10)
            }
            lastAndPercentStackView.snp.makeConstraints {
                $0.top.bottom.right.equalToSuperview().inset(10).priority(.high)
            }
            
    }
    
    func configure(quote: Quote) {
        tickerLabel.text = quote.ticker
        lastLabel.text = quote.last
        
        let doublePercent = (Double(quote.percentChange) ?? 00)*100
        percentLabel.text = "\(Double(round(100*doublePercent)/100))%"
    }
}
