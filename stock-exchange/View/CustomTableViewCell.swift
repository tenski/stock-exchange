//
//  CustomTableViewCell.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel, lastLabel, highestLabel, percentLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private var idLabel: UILabel = {
        var idLabel = UILabel()
        idLabel.textColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        idLabel.textAlignment = .left
        idLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return idLabel
    }()
    
    private var lastLabel: UILabel = {
        var lastLabel = UILabel()
        lastLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lastLabel.textAlignment = .left
        lastLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return lastLabel
    }()
    
    private var highestLabel: UILabel = {
        var highestLabel = UILabel()
        highestLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        highestLabel.textAlignment = .left
        highestLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return highestLabel
    }()
    
    private var percentLabel: UILabel = {
        var percentLabel = UILabel()
        percentLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        percentLabel.textAlignment = .left
        percentLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return percentLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.add(subviews: labelStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        id_label.frame = CGRect(x: UIScreen.main.bounds.width/30, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
//        last_label.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
//        highestBid_label.frame = CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
//        percentChange_label.frame = CGRect(x: UIScreen.main.bounds.width/4*3, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
//    }
    
    func configure(quote: Quote) {
        idLabel.text = quote.ticker
        lastLabel.text = quote.last
        highestLabel.text = quote.highestBid
        percentLabel.text = quote.percentChange
    }

}
