//
//  ContentViewModel.swift
//  CurrencyConvertor
//
//  Created by chuonpiseth on 21/5/26.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var convertedAmount = 1.0
    @Published var baseAmount = 1.0
    @Published var baseCurrency: CurrencyChoice = .Usa
    @Published var convertedCurrency: CurrencyChoice = .Usa
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }
}
