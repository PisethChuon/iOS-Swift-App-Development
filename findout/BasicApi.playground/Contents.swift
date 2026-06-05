enum NetworkError: Error {
    case invalideURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingError
}

func fetchUsers() async throws -> [User] {
    guard let url = URL(
        strint: "https://jsonplaceholder.typicode.com/users"
    ) else {
        throw NetworkError.invalidURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpsResponse = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponse
    }
}
