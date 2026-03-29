//
//  Currency.swift
//  Income
//
//  Created by chuonpiseth on 29/3/26.
//

import Foundation

enum Currency: CaseIterable {
    case usd, pounds
    
    var title: String {
        switch self {
        case .usd: return "USD"
        case .pounds: return "Pounds"
        }
    }
}
