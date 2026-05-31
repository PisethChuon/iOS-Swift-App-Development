import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

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
    
    do {
        let users = try JSONDecoder().decode([User].self, from: data)
//        for user in users {
//            print(user.name, "-", user.email)
//        }
        print(users[1].name)
    } catch {
        print(error)
    }
    
    
}

task.resume()
