//
//  CoinStackView.swift
//  ByteCoin
//
//  Created by Лилия Феодотова on 20.02.2023.
//

import UIKit

class CoinStackView: UIStackView {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bitcoinsign.circle.fill")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(named: "Icon Color")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    func setupView(){
        addArrangedSubview(image)
        addArrangedSubview(label)
        addArrangedSubview(currencyLabel)
        
        axis = .horizontal
        alignment = .center
        distribution = .fill
        spacing = 10
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 80),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
