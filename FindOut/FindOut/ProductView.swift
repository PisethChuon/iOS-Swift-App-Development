//
//  ProductView.swift
//  FindOut
//
//  Created by chuonpiseth on 23/8/26.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        List {
            ForEach(products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Image(systemName: "heart")
                }
            }
        }
    }
}

#Preview {
    ProductView()
}
