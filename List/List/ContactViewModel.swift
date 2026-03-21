//
//  FruitViewModel.swift
//  List
//
//  Created by chuonpiseth on 21/3/26.
//

import Foundation
import SwiftUI
import Combine

struct Contacts: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: String
}

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contacts] = [
        Contacts(name: "Chuon Piseth", phoneNumber: "0812345678"),
        Contacts(name: "Chhin Vanchhai", phoneNumber: "0812345678"),
        Contacts(name: "Chuon Kimchuon", phoneNumber: "124567890"),
    ]
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
}



