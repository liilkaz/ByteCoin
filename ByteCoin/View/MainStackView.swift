//
//  MainStackView.swift
//  ByteCoin
//
//  Created by Лилия Феодотова on 20.02.2023.
//

import UIKit

class MainStackView: UIStackView {
    
    let coinStackView = CoinStackView()
    
    let byteCoinLabel: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.textColor = UIColor(named: "Title Color")
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = .tertiaryLabel
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    func setupView(){
        addArrangedSubview(byteCoinLabel)
        addArrangedSubview(view)
        view.addSubview(coinStackView)
        
        axis = .vertical
        alignment = .center
        distribution = .fill
        spacing = 25
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            byteCoinLabel.widthAnchor.constraint(equalToConstant: 230),
            byteCoinLabel.heightAnchor.constraint(equalToConstant: 60),
            
            view.heightAnchor.constraint(equalToConstant: 80),
            view.topAnchor.constraint(equalTo: coinStackView.topAnchor),
            view.bottomAnchor.constraint(equalTo: coinStackView.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: coinStackView.trailingAnchor, constant: +10),
            view.leadingAnchor.constraint(equalTo: coinStackView.leadingAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
