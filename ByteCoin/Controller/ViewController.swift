//
//  ViewController.swift
//  ByteCoin
//
//  Created by Лилия Феодотова on 20.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let mainStackView = MainStackView()
    var coinManager = CoinManager()
    
    let pickerView: UIPickerView = {
        let view = UIPickerView()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        pickerView.dataSource = self
        pickerView.delegate = self
        coinManager.delegate = self
        
        setupView()
        setConstraints()
    }
    
    func setupView(){
        view.backgroundColor = UIColor(named: "Background Color")
        view.addSubview(mainStackView)
        view.addSubview(pickerView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            pickerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

//MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selected)
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{

    
    func didUpdate(_ coinManager: CoinManager, coin: CoinModel) {
        
        DispatchQueue.main.async {
            self.mainStackView.coinStackView.label.text = coin.rateString
            self.mainStackView.coinStackView.currencyLabel.text = coin.assetIDQuote
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
