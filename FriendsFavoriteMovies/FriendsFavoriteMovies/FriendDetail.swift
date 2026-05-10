//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by chuonpiseth on 10/5/26.
//

import Foundation
import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FriendDetail(friend: SampleData.shared.friend)
}
