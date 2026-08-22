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
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.products) {
                product in ProductRow(product: product)
            }
        }
    }
}

#Preview {
    ProductGridView(filter: .all)
}
