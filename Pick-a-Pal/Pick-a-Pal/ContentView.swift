//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by chuonpiseth on 4/9/26.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jasmin", "Po-Chum"]
    @State private var nameToAdd = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
