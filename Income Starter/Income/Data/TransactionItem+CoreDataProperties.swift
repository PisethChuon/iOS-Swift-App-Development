//
//  TransactionItem+CoreDataProperties.swift
//  Income
//
//  Created by chuonpiseth on 5/4/26.
//
//

public import Foundation
public import CoreData


public typealias TransactionItemCoreDataPropertiesSet = NSSet

extension TransactionItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionItem> {
        return NSFetchRequest<TransactionItem>(entityName: "TransactionItem")
    }

    @NSManaged public var amount: Double
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var type: Int16

}

extension TransactionItem : Identifiable {

}

extension TransactionItem {
    var wrappedId: UUID {
        return id!
    }
    
    var wrappedTitle: String {
        return title ?? ""
    }
    
    var wrappedDate: Date {
        return date ?? Date()
    }
    
    var wrappedTransactionType: TransactionType {
        return TransactionType(rawValue: Int(type)) ?? .expense
    }
    
    
    var wrappedAmount: Double {
        return amount
    }
}
