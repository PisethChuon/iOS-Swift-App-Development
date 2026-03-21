//
//  TransactionModel.swift
//  Income
//
//  Created by chuonpiseth on 21/3/26.
//

import Foundation

struct TransactionModel: Identifiable {
    let id = UUID()
    let title: String
    let amount: Double
    let date: Date
    let type: TransactionType
}
