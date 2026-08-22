//
//  ProductGridView.swift
//  Ecommerce
//
//  Created by chuonpiseth on 16/8/26.
//

import SwiftUI

struct ProductGridView: View {
    
    @State var viewModel: ProductGridViewModel
    
    init(filter: ProductFilter) {
        self.viewModel = ProductGridViewModel(filter: filter)
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, content: {
                ForEach(viewModel.products) {
                    product in ProductRow(product: product)
                }
            })
        }
    }
}

#Preview {
    ProductGridView(filter: .all)
}
