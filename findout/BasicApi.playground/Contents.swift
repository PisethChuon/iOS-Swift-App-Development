Task {
    do {
        let users = try await fetchUsers()
        print(users)
    } catch {
        print(error)
    }
}

