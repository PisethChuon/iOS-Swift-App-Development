//
//  SquareImageModifier.swift
//  Ecommerce
//
//  Created by chuonpiseth on 31/8/26.
//

import Foundation
import SwiftUI

extension Image {
    func squareImageStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70, height: 70)
    }
}
