//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 10/5/26.
//

import Foundation
import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}
