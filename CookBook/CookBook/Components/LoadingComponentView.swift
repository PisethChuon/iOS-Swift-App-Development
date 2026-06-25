//
//  LoadingComponentView.swift
//  CookBook
//
//  Created by chuonpiseth on 25/6/26.
//

import SwiftUI

struct LoadingComponentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            ProgressView()
                .tint(Color.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingComponentView()
}
