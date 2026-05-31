import Foundation

struct User: Codable {
    let id: Int
    let name: String
}

let data = """

{
  "user_id": 1,
  "full_name": "Piseth"
}

""".data(using: .utf8)!

do {
    let users = try JSONDecoder().decode(
        User.self,
        from: data
    )
    
    
} catch {
    print(error)
}
