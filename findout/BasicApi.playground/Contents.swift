enum NetworkError: Error {
    case invalideURL
    case invalidResponse
    case badStatusCode(Int)
    case decodingError
}


