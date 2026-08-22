//
//  BannerImageModifier.swift
//  Ecommerce
//
//  Created by chuonpiseth on 16/8/26.
//


import Foundation
import SwiftUI

extension Image {
    func bannerImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 250)
            .clipped()
    }
}
