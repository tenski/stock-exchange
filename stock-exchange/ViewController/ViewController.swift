//
//  ViewController.swift
//  stock-exchange
//
//  Created by Алексей Тен on 23.08.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let logo_box = UIView()
        self.view.addSubview(logo_box)
        
        logo_box.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)
        logo_box.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(UIScreen.main.bounds.height/8)
        }
        
        let my_title = UILabel()
        self.view.addSubview(my_title)
        
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
}

