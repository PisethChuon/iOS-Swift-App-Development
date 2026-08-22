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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ProductGridView(filter: .all)
}
