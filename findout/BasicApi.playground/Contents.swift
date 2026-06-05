Task {
    do {
        let users = try await fetchUsers()
        print(users)

    } catch NetworkError.invalidURL {
        print("Invalid URL")

    } catch NetworkError.invalidResponse {
        print("Invalid Response")

    } catch NetworkError.badStatusCode(let code) {
        print("Server returned \(code)")

    } catch NetworkError.decodingError {
        print("Failed to decode JSON")

    } catch {
        print("Unexpected error: \(error)")
    }
}
