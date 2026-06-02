import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

Task {
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        print("Recived \(data.count) bytes")
    } catch {
        print(error)
    }
}
