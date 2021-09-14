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
    
    private var id_label: UILabel = {
        var id_label = UILabel()
        id_label.textColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        id_label.textAlignment = .left
        //id_label.text = "BTC_BTS"
        id_label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return id_label
    }()
    
    private var last_label: UILabel = {
        var last_label = UILabel()
        last_label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        last_label.textAlignment = .left
        //last_label.text = "0.00000116"
        last_label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return last_label
    }()
    
//    private let last_label = CustomLabel()
    
    private var highestBid_label: UILabel = {
        var highestBid_label = UILabel()
        highestBid_label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        highestBid_label.textAlignment = .left
        //highestBid_label.text = "0.00000115"
        highestBid_label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return highestBid_label
    }()
    
    private var percentChange_label: UILabel = {
        var percentChange_label = UILabel()
        percentChange_label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        percentChange_label.textAlignment = .left
        //percentChange_label.text = "-0.06451612"
        percentChange_label.font = UIFont(name: "AvenirNextCondensed-Regular", size: 14)
        return percentChange_label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        contentView.addSubview(id_label)
        contentView.addSubview(last_label)
        contentView.addSubview(highestBid_label)
        contentView.addSubview(percentChange_label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //сделать setupViewsAndConstraints через стек!!
    
    /*override func layoutSubviews() {
        super.layoutSubviews()
        
        id_label.frame = CGRect(x: UIScreen.main.bounds.width/30, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
        last_label.frame = CGRect(x: UIScreen.main.bounds.width/4, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
        highestBid_label.frame = CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
        percentChange_label.frame = CGRect(x: UIScreen.main.bounds.width/4*3, y: 0, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/30)
    }*/
    
    func configure(quote: Quote) {
        id_label.text = quote.ticker
        last_label.text = quote.last
        highestBid_label.text = quote.highestBid
        percentChange_label.text = quote.percentChange
    }

}
