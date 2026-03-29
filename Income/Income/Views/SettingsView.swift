//
//  SettingsView.swift
//  Income
//
//  Created by chuonpiseth on 29/3/26.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var orderDescending = false
//    @State private var currency: Currency = .usd
    
    var body: some View {
        List {
            HStack {
                Toggle(isOn: $orderDescending) {
                    Text("Order \(orderDescending ? "(Earliest)" : "(Latest)")")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
