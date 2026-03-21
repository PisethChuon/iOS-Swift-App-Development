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
        List (vm.contacts) { contact in
            Text(contact.name)
        }
   
        
    }
    
}

#Preview {
    ContentView()
}
