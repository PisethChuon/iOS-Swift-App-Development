//
//  ProductRow.swift
//  Ecommerce
//
//  Created by chuonpiseth on 16/8/26.
//

import SwiftUI

struct ProductRow: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(UnevenRoundedRectangle(
                    cornerRadii: .init(
                        topLeading: 8,
                        bottomLeading: 0,
                        bottomTrailing: 0,
                        topTrailing: 8)))
                .clipped()
            Group {
                Text(product.title)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(1)
                Text(product.displayPrice)
                    .font(.system(size: 15, weight: .semibold))
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.yellow)
                    Text("\(product.displayRating)")
                        .font(.system(size: 14))
                }
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .frame(width: 150, height: 270)
        .overlay(alignment: .topTrailing, content: {
            Button(action: {
                
            }, label: {
                Image(systemName: "heart")
            })
            .padding(8)
        })
        .overlay{
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(uiColor: UIColor.lightGray)
                    .opacity(0.4), lineWidth: 1)
        }
    }
}

#Preview {
    ProductRow(product: ProductsClient.fetchProducts()[0])
}
