//
//  CustomLabel.swift
//  stock-exchange
//
//  Created by Алексей Тен on 25.08.2021.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.textAlignment = .left
        self.font = UIFont(name: "AvenirNextCondensed-Bold", size: 14)
    }
}
