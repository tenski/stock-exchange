//
//  ViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 23.08.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {
    
    let urlString = "https://poloniex.com/public?command=returnTicker"
    let networkDataFetcher = NetworkDataFetcher()
    var searchResponse: SearchResponse? = nil
    
    let tableView = UITableView()
    let logo_box = UIView()
    let my_title = UILabel()
    let header_box = UIView()
    let header_label = UILabel()
    
    let nameTitle = CustomLabel()
    let lastTitle = CustomLabel()
    let highestTitle = CustomLabel()
    let percentTitle = CustomLabel()
    let titlesBox = UIView()
    
    var quotes: [Quote] = []
    var names: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLogoBox()
        setupTitle()
        setupNames()
        setupTableView()
        print(quotes)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.networkDataFetcher.fetchQuotes(urlString: self.urlString) { (searchResponse) in
                guard let searchResponse = searchResponse else { return }
                self.searchResponse = searchResponse
                
                let sorted = searchResponse.sorted { $0.key < $1.key}
                self.quotes = sorted.compactMap {
                    $0.value
                }
                
                self.names = sorted.compactMap {
                    $0.key
                }
                
                self.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(UIScreen.main.bounds.height*7/8-UIScreen.main.bounds.height/20)
        }
            
    }
    
    
    private func setupLogoBox() {
        
        view.addSubview(logo_box)
        
        logo_box.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        
        logo_box.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(UIScreen.main.bounds.height/8)
        }
    }
    
    
    private func setupTitle() {
        
        view.addSubview(my_title)
        
        my_title.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        my_title.numberOfLines = 2
        my_title.textAlignment = .center
        my_title.text = "Stock Market\n by tenski"
        my_title.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        
        my_title.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(logo_box)
            make.centerY.equalTo(UIScreen.main.bounds.height/12)
        }
    }

    private func setupNames() {
        view.addSubview(nameTitle)
        view.addSubview(lastTitle)
        view.addSubview(highestTitle)
        view.addSubview(percentTitle)
        view.addSubview(titlesBox)
        
        nameTitle.text = "Currancy pair"
        lastTitle.text = "last"
        highestTitle.text = "highestBid"
        percentTitle.text = "percentChange"
        
        nameTitle.frame = CGRect(x: UIScreen.main.bounds.width/40, y: UIScreen.main.bounds.height/7, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/40)
        lastTitle.frame = CGRect(x: UIScreen.main.bounds.width/16*5, y: UIScreen.main.bounds.height/7, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/40)
        highestTitle.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/7, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/40)
        percentTitle.frame = CGRect(x: UIScreen.main.bounds.width/4*3, y: UIScreen.main.bounds.height/7, width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/40)
        
        titlesBox.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titlesBox.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(logo_box)
            make.height.equalTo(UIScreen.main.bounds.height/20)
            make.top.equalTo(UIScreen.main.bounds.height/8)
        }
    }
}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        let quote = quotes[indexPath.row]
        let name = names[indexPath.row]
        cell.updateViews(quote: quote, name: name)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/30
    }
    
}

