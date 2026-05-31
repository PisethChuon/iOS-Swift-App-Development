import Foundation

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let error = error {
        print("Error: \(error)")
        return
    }
    
    guard let data = data else {
        print("No data received")
        return
    }
    
    print(String(data: data, encoding: .utf8) ?? "")
    
}

task.resume()
