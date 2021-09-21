//
//  CollectionViewCell.swift
//  stock-exchange
//
//  Created by Алексей Тен on 21.09.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CollectionViewCell"

    private lazy var lastAndPercentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastLabel, percentLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
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


    override init(frame: CGRect) {
        super.init(frame: .zero)
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
            $0.bottom.left.equalToSuperview().inset(10)
            $0.top.equalTo(tickerImageView.snp.bottom).offset(10)
        }
    }

    func configure(quote: Quote) {
        self.
        tickerLabel.text = quote.ticker
        lastLabel.text = quote.last

        let doublePercent = (Double(quote.percentChange) ?? 00)*100
        percentLabel.text = "\(Double(round(100*doublePercent)/100))%"
    }
}
