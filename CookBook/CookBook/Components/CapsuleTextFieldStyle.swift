//
//  CapsuleTextFieldStyle.swift
//  CookBook
//
//  Created by chuonpiseth on 19/6/26.
//

import Foundation
import SwiftUI

struct CapsuleTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(
                Capsule()
                    .fill(Color.primaryFormEntry)
            )
    }
}
