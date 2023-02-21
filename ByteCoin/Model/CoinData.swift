//
//  CoinData.swift
//  ByteCoin
//
//  Created by Лилия Феодотова on 21.02.2023.
//

import Foundation

struct CoinData: Codable {
    let assetIDQuote: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
            case assetIDQuote = "asset_id_quote"
            case rate
        }
}
