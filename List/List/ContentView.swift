//
//  ContentView.swift
//  List
//
//  Created by chuonpiseth on 19/3/26.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var vm = ContactViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (vm.contacts) { contact in
                    NavigationLink(destination: Text(contact.phoneNumber)) {
                        Text(contact.name)
                    }
                }
                .onDelete(perform: vm.deleteContact)
            }
        }
        .navigationTitle(Text("Contacts"))
    }
}

#Preview {
    ContentView()
}
