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
    @Published var rates: Rates?
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        return numberFormatter
    }
    func fetchRates() async {
        
        guard let url = URL(string: "https://openexchangerates.org/api/latest.json?app_id=a921f26b655c4b4597b4d60d4106ed50") else {
            errorMessage = "Could not fetch rates."
            print("API url invalid")
            return
        }
        let urlRequest = URLRequest(url: url)
        isLoading = true
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            rates = try JSONDecoder().decode(Rates.self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
    
    func convert() {
        if let rates = rates,
           let baseExchangeRate = rates.rates[baseCurrency.rawValue],
           let convertedExchangeRate = rates.rates[convertedCurrency.rawValue] {
            convertedAmount = (convertedExchangeRate / baseExchangeRate) * baseAmount
        }
    }
    
}
