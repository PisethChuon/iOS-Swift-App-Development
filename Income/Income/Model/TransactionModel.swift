//
//  TransactionModel.swift
//  Income
//
//  Created by chuonpiseth on 21/3/26.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let type: TransactionType
    let date: Date
}
