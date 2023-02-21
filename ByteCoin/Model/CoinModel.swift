//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Лилия Феодотова on 21.02.2023.
//

import Foundation

struct CoinModel{
    let assetIDQuote: String
    let rate: Double
    
    var rateString: String{
        return String(format: "%.2f", rate)
    }
}
