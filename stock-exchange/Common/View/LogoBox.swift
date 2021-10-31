//
//  LogoBox.swift
//  stock-exchange
//
//  Created by Алексей Тен on 31.10.2021.
//

import UIKit

class LogoBox: UIView {
    private lazy var tenskiTitle: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Stock Market"
        label.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        return label
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: tenskiTitle.intrinsicContentSize.width + 20,
            height: tenskiTitle.intrinsicContentSize.height
        )
    }
    
    init() {
        super.init(frame: .zero)
        setupViewsAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LogoBox {
    func setupViewsAndConstraints() {
        backgroundColor = #colorLiteral(red: 0.8588235294, green: 0.2745098039, blue: 0.2, alpha: 1)
        
        add(subviews: tenskiTitle)
        
        tenskiTitle.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(10)
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
}
