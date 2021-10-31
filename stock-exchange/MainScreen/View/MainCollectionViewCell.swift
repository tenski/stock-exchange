//
//  CollectionViewCell.swift
//  stock-exchange
//
//  Created by Алексей Тен on 21.09.2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    static let identifier = "MainCollectionViewCell"
    
    private var borderView: UIView = {
        var view = UIView()
        view.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.2745098174, blue: 0.2, alpha: 1)
        return view
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

    func configure(quote: Quote) {
        tickerLabel.text = quote.ticker
        lastLabel.text = quote.last

        let doublePercent = (Double(quote.percentChange) ?? 00)*100
        percentLabel.text = "\(Double(round(100*doublePercent)/100))%"
    }
}

private extension MainCollectionViewCell {
    func setupViewsAndConstraints() {
        contentView.add(subviews: borderView, tickerImageView, tickerLabel, lastLabel, percentLabel)

        borderView.snp.makeConstraints {
            $0.bottom.right.equalToSuperview()
            $0.top.left.equalToSuperview().offset(5)
        }
        tickerImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(15)
            $0.width.height.equalTo(40)
        }
        tickerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.right.equalToSuperview().inset(10)
        }
        lastLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(tickerImageView.snp.bottom).offset(10)
        }
        percentLabel.snp.makeConstraints {
            $0.bottom.right.equalToSuperview().inset(10)
            $0.top.equalTo(tickerImageView.snp.bottom).offset(10)
        }
    }
}
